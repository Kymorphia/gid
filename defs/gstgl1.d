//!gir GstGL-1.0
//!info description "D binding for the GstGL library - OpenGL for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstgl1/
//!info capi https://gstreamer.freedesktop.org/documentation/gl/index.html

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set function[buffer_add_gl_sync_meta].return-value[][gid-borrow] buffer
//!set function[buffer_add_gl_sync_meta_full].return-value[][gid-borrow] buffer

//# Conflicts with copy method
//!set record[GLAllocationParams].field[copy][ignore] 1

//# Hand-written below: Uniform value arrays with a count of vectors/matrices (not the number of values)
//!set class[GLShader].method[set_uniform_2fv][ignore] 1
//!set class[GLShader].method[set_uniform_3fv][ignore] 1
//!set class[GLShader].method[set_uniform_4fv][ignore] 1
//!set class[GLShader].method[set_uniform_2iv][ignore] 1
//!set class[GLShader].method[set_uniform_3iv][ignore] 1
//!set class[GLShader].method[set_uniform_4iv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_2fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_2x3fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_2x4fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_3fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_3x2fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_3x4fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_4fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_4x2fv][ignore] 1
//!set class[GLShader].method[set_uniform_matrix_4x3fv][ignore] 1

//# Disable class APIs
//!set class[GLFilter].function[add_rgba_pad_templates][ignore] 1

//# caller-allocated-out-array (Caller allocated output array)
//!set function[gl_swizzle_invert].parameters.parameter[inversion][caller-allocates] 1
//!set function[gl_video_format_swizzle].parameters.parameter[swizzle][caller-allocates] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[GLAllocationParams].field[alloc_params][writable] 0
//!set record[GLBaseMemory].field[mem][writable] 0
//!set record[GLBaseMemory].field[query][writable] 0
//!set record[GLBuffer].field[mem][writable] 0
//!set record[GLBufferAllocationParams].field[parent][writable] 0
//!set record[GLMemory].field[mem][writable] 0
//!set record[GLMemory].field[info][writable] 0
//!set record[GLSyncMeta].field[parent][writable] 0
//!set record[GLVideoAllocationParams].field[parent][writable] 0
//!set record[GLVideoAllocationParams].field[valign][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[GLAllocationParams].field[context][writable] 0
//!set record[GLBaseMemory].field[context][writable] 0
//!set record[GLVideoAllocationParams].field[v_info][writable] 0

//# Ignore: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[GLAllocationParams].field[user_data][ignore] 1
//!set record[GLAllocationParams].field[wrapped_data][ignore] 1
//!set record[GLAllocationParams].field[gl_handle][ignore] 1
//!set record[GLBaseMemory].field[data][ignore] 1
//!set record[GLSyncMeta].field[data][ignore] 1

//# Disable: Use D native synchronization primitives instead (GLib Mutex/RecMutex/Cond/Private are disabled)
//!set record[GLBaseMemory].field[lock][ignore] 1

//# Closure parameter is named 'stuff' and not detected automatically
//!set callback[GLFramebufferFunc].parameters.parameter[stuff][closure] 0

//# Wrapped memory release callbacks have no user_data, mark the GDestroyNotify data parameter as its closure
//!set record[GLRenderbufferAllocationParams].constructor[new_wrapped].parameters.parameter[notify][closure] 6
//!set record[GLVideoAllocationParams].constructor[new_wrapped_data].parameters.parameter[notify][closure] 8
//!set record[GLVideoAllocationParams].constructor[new_wrapped_gl_handle].parameters.parameter[notify][closure] 8
//!set record[GLVideoAllocationParams].constructor[new_wrapped_texture].parameters.parameter[notify][closure] 8

//# Ignore: GLDisplay window lookup using a GCompareFunc with positional data (find_window is deprecated), rarely useful outside of GL elements
//!set class[GLDisplay].method[find_window][ignore] 1
//!set class[GLDisplay].method[retrieve_window][ignore] 1

//# Ignore: Low-level memory initializers for allocator implementations, not useful from D
//!set record[GLBaseMemory].method[init][ignore] 1
//!set record[GLMemory].method[init][ignore] 1
//!class GLShader

  // Set a uniform value array with a count of vectors/matrices of size values (logs a critical if not a multiple)
  private void _setUniformArray(alias cFunc, size_t size, T, A...)(string funcName, string name, T[] value, A matrixArgs) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    if (value.length % size != 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstgl.glshader.GLShader.%.*s value length %d is not a multiple of %d",
        cast(int)funcName.length, funcName.ptr, cast(int)value.length, cast(int)size);
      return;
    }

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);

    static if (A.length > 0) // Matrix: gint count, gboolean transpose
      cFunc(cast(GstGLShader*)this._cPtr, _name, cast(int)(value.length / size), matrixArgs[0], value.ptr);
    else
      cFunc(cast(GstGLShader*)this._cPtr, _name, cast(uint)(value.length / size), value.ptr);
  }

  /**
      Perform `glUniform2fv()` for name on shader.
      Params:
        name = name of the uniform
        value = values to set, 2 for each vector (the vector count is value.length / 2)
  */
  void setUniform2fv(string name, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_2fv, 2)("setUniform2fv", name, value);
  }

  /**
      Perform `glUniform3fv()` for name on shader.
      Params:
        name = name of the uniform
        value = values to set, 3 for each vector (the vector count is value.length / 3)
  */
  void setUniform3fv(string name, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_3fv, 3)("setUniform3fv", name, value);
  }

  /**
      Perform `glUniform4fv()` for name on shader.
      Params:
        name = name of the uniform
        value = values to set, 4 for each vector (the vector count is value.length / 4)
  */
  void setUniform4fv(string name, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_4fv, 4)("setUniform4fv", name, value);
  }

  /**
      Perform `glUniform2iv()` for name on shader.
      Params:
        name = name of the uniform
        value = values to set, 2 for each vector (the vector count is value.length / 2)
  */
  void setUniform2iv(string name, int[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_2iv, 2)("setUniform2iv", name, value);
  }

  /**
      Perform `glUniform3iv()` for name on shader.
      Params:
        name = name of the uniform
        value = values to set, 3 for each vector (the vector count is value.length / 3)
  */
  void setUniform3iv(string name, int[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_3iv, 3)("setUniform3iv", name, value);
  }

  /**
      Perform `glUniform4iv()` for name on shader.
      Params:
        name = name of the uniform
        value = values to set, 4 for each vector (the vector count is value.length / 4)
  */
  void setUniform4iv(string name, int[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_4iv, 4)("setUniform4iv", name, value);
  }

  /**
      Perform `glUniformMatrix2fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 4 for each 2x2 matrix (the matrix count is value.length / 4)
  */
  void setUniformMatrix2fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_2fv, 4)("setUniformMatrix2fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix2x3fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 6 for each 2x3 matrix (the matrix count is value.length / 6)
  */
  void setUniformMatrix2x3fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_2x3fv, 6)("setUniformMatrix2x3fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix2x4fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 8 for each 2x4 matrix (the matrix count is value.length / 8)
  */
  void setUniformMatrix2x4fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_2x4fv, 8)("setUniformMatrix2x4fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix3fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 9 for each 3x3 matrix (the matrix count is value.length / 9)
  */
  void setUniformMatrix3fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_3fv, 9)("setUniformMatrix3fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix3x2fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 6 for each 3x2 matrix (the matrix count is value.length / 6)
  */
  void setUniformMatrix3x2fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_3x2fv, 6)("setUniformMatrix3x2fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix3x4fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 12 for each 3x4 matrix (the matrix count is value.length / 12)
  */
  void setUniformMatrix3x4fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_3x4fv, 12)("setUniformMatrix3x4fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix4fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 16 for each 4x4 matrix (the matrix count is value.length / 16)
  */
  void setUniformMatrix4fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_4fv, 16)("setUniformMatrix4fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix4x2fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 8 for each 4x2 matrix (the matrix count is value.length / 8)
  */
  void setUniformMatrix4x2fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_4x2fv, 8)("setUniformMatrix4x2fv", name, value, transpose);
  }

  /**
      Perform `glUniformMatrix4x3fv()` for name on shader.
      Params:
        name = name of the uniform
        transpose = transpose the matrix
        value = values to set, 12 for each 4x3 matrix (the matrix count is value.length / 12)
  */
  void setUniformMatrix4x3fv(string name, bool transpose, float[] value) nothrow
  {
    _setUniformArray!(gst_gl_shader_set_uniform_matrix_4x3fv, 12)("setUniformMatrix4x3fv", name, value, transpose);
  }
