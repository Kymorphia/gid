/// Module for [GLDisplayEGLDevice] class
module gstglegl.gldisplay_egldevice;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstgl.gldisplay;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    the contents of a #GstGLDisplayEGLDevice are private and should only be accessed
    through the provided API
*/
class GLDisplayEGLDevice : gstgl.gldisplay.GLDisplay
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_egl_device_get_type != &gidSymbolNotFound ? gst_gl_display_egl_device_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplayEGLDevice self()
  {
    return this;
  }

  /**
      Get builder for [gstglegl.gldisplay_egldevice.GLDisplayEGLDevice]
      Returns: New builder object
  */
  static GLDisplayEGLDeviceGidBuilder builder()
  {
    return new GLDisplayEGLDeviceGidBuilder;
  }

  /**
      Create a new #GstGLDisplayEGLDevice with an EGLDevice supported device
  
      Params:
        deviceIndex = the index of device to use
      Returns: a new #GstGLDisplayEGLDevice or null
  */
  this(uint deviceIndex)
  {
    GstGLDisplayEGLDevice* _cretval;
    _cretval = gst_gl_display_egl_device_new(deviceIndex);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GstGLDisplayEGLDevice with EGLDeviceEXT .
      The device must be created using EGLDevice enumeration.
  
      Params:
        device = an existing EGLDeviceEXT
      Returns: a new #GstGLDisplayEGLDevice
  */
  static gstglegl.gldisplay_egldevice.GLDisplayEGLDevice newWithEglDevice(void* device = null)
  {
    GstGLDisplayEGLDevice* _cretval;
    _cretval = gst_gl_display_egl_device_new_with_egl_device(device);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstglegl.gldisplay_egldevice.GLDisplayEGLDevice)(cast(GstGLDisplayEGLDevice*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gstglegl.gldisplay_egldevice.GLDisplayEGLDevice]
class GLDisplayEGLDeviceGidBuilderImpl(T) : gstgl.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gstglegl.gldisplay_egldevice.GLDisplayEGLDevice]
final class GLDisplayEGLDeviceGidBuilder : GLDisplayEGLDeviceGidBuilderImpl!GLDisplayEGLDeviceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLDisplayEGLDevice build()
  {
    return new GLDisplayEGLDevice(cast(void*)createGObject(GLDisplayEGLDevice._getGType), Yes.Take);
  }
}
