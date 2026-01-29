/// Module for [Surface] class
module cairo.surface;

import cairo.c.functions;
import cairo.c.types;
import cairo.device;
import cairo.font_options;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A #cairo_surface_t represents an image, either as the destination
    of a drawing operation or as source when drawing onto another
    surface.  To draw to a #cairo_surface_t, create a cairo context
    with the surface as the target, using [cairo.global.create].
    
    There are different subtypes of #cairo_surface_t for
    different drawing backends; for example, [cairo.global.imageSurfaceCreate]
    creates a bitmap image in memory.
    The type of a surface can be queried with [cairo.surface.Surface.getSurfaceType].
    
    The initial contents of a surface after creation depend upon the manner
    of its creation. If cairo creates the surface and backing storage for
    the user, it will be initially cleared; for example,
    [cairo.global.imageSurfaceCreate] and [cairo.surface.Surface.createSimilar].
    Alternatively, if the user passes in a reference to some backing storage
    and asks cairo to wrap that in a #cairo_surface_t, then the contents are
    not modified; for example, [cairo.global.imageSurfaceCreateForData] and
    cairo_xlib_surface_create().
    
    Memory management of #cairo_surface_t is done with
    [cairo.surface.Surface.reference] and [cairo.surface.Surface.destroy].
*/
class Surface : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_surface_get_type != &gidSymbolNotFound ? cairo_gobject_surface_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Surface self()
  {
    return this;
  }

  /**
      Emits the current page for backends that support multiple pages,
      but doesn't clear it, so that the contents of the current page will
      be retained for the next page.  Use [cairo.surface.Surface.showPage] if you
      want to get an empty page after the emission.
      
      There is a convenience function for this that takes a #cairo_t,
      namely [cairo.context.Context.copyPage].
  */
  void copyPage()
  {
    cairo_surface_copy_page(cast(cairo_surface_t*)this._cPtr);
  }

  /**
      Create a new surface that is a rectangle within the target surface.
      All operations drawn to this surface are then clipped and translated
      onto the target surface. Nothing drawn via this sub-surface outside of
      its bounds is drawn onto the target surface, making this a useful method
      for passing constrained child surfaces to library routines that draw
      directly onto the parent surface, i.e. with no further backend allocations,
      double buffering or copies.
      
      <note><para>The semantics of subsurfaces have not been finalized yet
      unless the rectangle is in full device units, is contained within
      the extents of the target surface, and the target or subsurface's
      device transforms are not changed.</para></note>
  
      Params:
        x = the x-origin of the sub-surface from the top-left of the target surface (in device-space units)
        y = the y-origin of the sub-surface from the top-left of the target surface (in device-space units)
        width = width of the sub-surface (in device-space units)
        height = height of the sub-surface (in device-space units)
      Returns: a pointer to the newly allocated surface. The caller
        owns the surface and should call [cairo.surface.Surface.destroy] when done
        with it.
        
        This function always returns a valid pointer, but it will return a
        pointer to a "nil" surface if other is already in an error state
        or any other error occurs.
  */
  cairo.surface.Surface createForRectangle(double x, double y, double width, double height)
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_surface_create_for_rectangle(cast(cairo_surface_t*)this._cPtr, x, y, width, height);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new surface that exists solely to watch another is doing. In
      the process it will log operations and times, which are fast, which are
      slow, which are frequent, etc.
      
      The mode parameter can be set to either `CAIRO_SURFACE_OBSERVER_NORMAL`
      or `CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS`, to control whether or not
      the internal observer should record operations.
  
      Params:
        mode = sets the mode of operation (normal vs. record)
      Returns: a pointer to the newly allocated surface. The caller
        owns the surface and should call [cairo.surface.Surface.destroy] when done
        with it.
        
        This function always returns a valid pointer, but it will return a
        pointer to a "nil" surface if other is already in an error state
        or any other error occurs.
  */
  cairo.surface.Surface createObserver(cairo.types.SurfaceObserverMode mode)
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_surface_create_observer(cast(cairo_surface_t*)this._cPtr, mode);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new surface that is as compatible as possible with an
      existing surface. For example the new surface will have the same
      device scale, fallback resolution and font options as
      other. Generally, the new surface will also use the same backend
      as other, unless that is not possible for some reason. The type of
      the returned surface may be examined with
      [cairo.surface.Surface.getSurfaceType].
      
      Initially the surface contents are all 0 (transparent if contents
      have transparency, black otherwise.)
      
      Use [cairo.surface.Surface.createSimilarImage] if you need an image surface
      which can be painted quickly to the target surface.
  
      Params:
        content = the content for the new surface
        width = width of the new surface, (in device-space units)
        height = height of the new surface (in device-space units)
      Returns: a pointer to the newly allocated surface. The caller
        owns the surface and should call [cairo.surface.Surface.destroy] when done
        with it.
        
        This function always returns a valid pointer, but it will return a
        pointer to a "nil" surface if other is already in an error state
        or any other error occurs.
  */
  cairo.surface.Surface createSimilar(cairo.types.Content content, int width, int height)
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_surface_create_similar(cast(cairo_surface_t*)this._cPtr, content, width, height);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new image surface that is as compatible as possible for uploading
      to and the use in conjunction with an existing surface. However, this surface
      can still be used like any normal image surface. Unlike
      [cairo.surface.Surface.createSimilar] the new image surface won't inherit
      the device scale from other.
      
      Initially the surface contents are all 0 (transparent if contents
      have transparency, black otherwise.)
      
      Use [cairo.surface.Surface.createSimilar] if you don't need an image surface.
  
      Params:
        format = the format for the new surface
        width = width of the new surface, (in pixels)
        height = height of the new surface (in pixels)
      Returns: a pointer to the newly allocated image surface. The caller
        owns the surface and should call [cairo.surface.Surface.destroy] when done
        with it.
        
        This function always returns a valid pointer, but it will return a
        pointer to a "nil" surface if other is already in an error state
        or any other error occurs.
  */
  cairo.surface.Surface createSimilarImage(cairo.types.Format format, int width, int height)
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_surface_create_similar_image(cast(cairo_surface_t*)this._cPtr, format, width, height);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function finishes the surface and drops all references to
      external resources.  For example, for the Xlib backend it means
      that cairo will no longer access the drawable, which can be freed.
      After calling [cairo.surface.Surface.finish] the only valid operations on a
      surface are checking status, getting and setting user, referencing
      and destroying, and flushing and finishing it.
      Further drawing to the surface will not affect the
      surface but will instead trigger a [cairo.types.Status.SurfaceFinished]
      error.
      
      When the last call to [cairo.surface.Surface.destroy] decreases the
      reference count to zero, cairo will call [cairo.surface.Surface.finish] if
      it hasn't been called already, before freeing the resources
      associated with the surface.
  */
  void finish()
  {
    cairo_surface_finish(cast(cairo_surface_t*)this._cPtr);
  }

  /**
      Do any pending drawing for the surface and also restore any temporary
      modifications cairo has made to the surface's state. This function
      must be called before switching from drawing on the surface with
      cairo to drawing on it directly with native APIs, or accessing its
      memory outside of Cairo. If the surface doesn't support direct
      access, then this function does nothing.
  */
  void flush()
  {
    cairo_surface_flush(cast(cairo_surface_t*)this._cPtr);
  }

  /**
      This function returns the content type of surface which indicates
      whether the surface contains color and/or alpha information. See
      #cairo_content_t.
      Returns: The content type of surface.
  */
  cairo.types.Content getContent()
  {
    cairo_content_t _cretval;
    _cretval = cairo_surface_get_content(cast(cairo_surface_t*)this._cPtr);
    cairo.types.Content _retval = cast(cairo.types.Content)_cretval;
    return _retval;
  }

  /**
      This function returns the device for a surface.
      See #cairo_device_t.
      Returns: The device for surface or null if the surface does
                      not have an associated device.
  */
  cairo.device.Device getDevice()
  {
    cairo_device_t* _cretval;
    _cretval = cairo_surface_get_device(cast(cairo_surface_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.device.Device(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function returns the previous device offset set by
      [cairo.surface.Surface.setDeviceOffset].
  
      Params:
        xOffset = the offset in the X direction, in device units
        yOffset = the offset in the Y direction, in device units
  */
  void getDeviceOffset(out double xOffset, out double yOffset)
  {
    cairo_surface_get_device_offset(cast(cairo_surface_t*)this._cPtr, cast(double*)&xOffset, cast(double*)&yOffset);
  }

  /**
      This function returns the previous device scale set by
      [cairo.surface.Surface.setDeviceScale].
  
      Params:
        xScale = the scale in the X direction, in device units
        yScale = the scale in the Y direction, in device units
  */
  void getDeviceScale(out double xScale, out double yScale)
  {
    cairo_surface_get_device_scale(cast(cairo_surface_t*)this._cPtr, cast(double*)&xScale, cast(double*)&yScale);
  }

  /**
      This function returns the previous fallback resolution set by
      [cairo.surface.Surface.setFallbackResolution], or default fallback
      resolution if never set.
  
      Params:
        xPixelsPerInch = horizontal pixels per inch
        yPixelsPerInch = vertical pixels per inch
  */
  void getFallbackResolution(out double xPixelsPerInch, out double yPixelsPerInch)
  {
    cairo_surface_get_fallback_resolution(cast(cairo_surface_t*)this._cPtr, cast(double*)&xPixelsPerInch, cast(double*)&yPixelsPerInch);
  }

  /**
      Retrieves the default font rendering options for the surface.
      This allows display surfaces to report the correct subpixel order
      for rendering on them, print surfaces to disable hinting of
      metrics and so forth. The result can then be used with
      [cairo.global.scaledFontCreate].
  
      Params:
        options = a #cairo_font_options_t object into which to store
            the retrieved options. All existing values are overwritten
  */
  void getFontOptions(cairo.font_options.FontOptions options)
  {
    cairo_surface_get_font_options(cast(cairo_surface_t*)this._cPtr, options ? cast(cairo_font_options_t*)options._cPtr(No.Dup) : null);
  }

  /**
      Return mime data previously attached to surface using the
      specified mime type.  If no data has been attached with the given
      mime type, data is set null.
  
      Params:
        mimeType = the mime type of the image data
        data = the image data to attached to the surface
  */
  void getMimeData(string mimeType, out ubyte[] data)
  {
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    gulong _length;
    const(ubyte)* _data;
    cairo_surface_get_mime_data(cast(cairo_surface_t*)this._cPtr, _mimeType, &_data, &_length);
    data.length = _length;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _length];
  }

  /**
      This function returns the type of the backend used to create
      a surface. See #cairo_surface_type_t for available types.
      Returns: The type of surface.
  */
  cairo.types.SurfaceType getSurfaceType()
  {
    cairo_surface_type_t _cretval;
    _cretval = cairo_surface_get_type(cast(cairo_surface_t*)this._cPtr);
    cairo.types.SurfaceType _retval = cast(cairo.types.SurfaceType)_cretval;
    return _retval;
  }

  /**
      Return user data previously attached to surface using the specified
      key.  If no user data has been attached with the given key this
      function returns null.
  
      Params:
        key = the address of the #cairo_user_data_key_t the user data was
          attached to
      Returns: the user data previously attached or null.
  */
  void* getUserData(cairo.types.UserDataKey key)
  {
    auto _retval = cairo_surface_get_user_data(cast(cairo_surface_t*)this._cPtr, &key);
    return _retval;
  }

  /**
      Returns whether the surface supports
      sophisticated [cairo.context.Context.showTextGlyphs] operations.  That is,
      whether it actually uses the provided text and cluster data
      to a [cairo.context.Context.showTextGlyphs] call.
      
      Note: Even if this function returns false, a
      [cairo.context.Context.showTextGlyphs] operation targeted at surface will
      still succeed.  It just will
      act like a [cairo.context.Context.showGlyphs] operation.  Users can use this
      function to avoid computing UTF-8 text and cluster mapping if the
      target surface does not use it.
      Returns: true if surface supports
                      [cairo.context.Context.showTextGlyphs], false otherwise
  */
  cairo.types.Bool hasShowTextGlyphs()
  {
    cairo.types.Bool _retval;
    _retval = cairo_surface_has_show_text_glyphs(cast(cairo_surface_t*)this._cPtr);
    return _retval;
  }

  /**
      Returns an image surface that is the most efficient mechanism for
      modifying the backing store of the target surface. The region retrieved
      may be limited to the extents or null for the whole surface
      
      Note, the use of the original surface as a target or source whilst
      it is mapped is undefined. The result of mapping the surface
      multiple times is undefined. Calling [cairo.surface.Surface.destroy] or
      [cairo.surface.Surface.finish] on the resulting image surface results in
      undefined behavior. Changing the device transform of the image
      surface or of surface before the image surface is unmapped results
      in undefined behavior.
  
      Params:
        extents = limit the extraction to an rectangular region
      Returns: a pointer to the newly allocated image surface. The caller
        must use [cairo.surface.Surface.unmapImage] to destroy this image surface.
        
        This function always returns a valid pointer, but it will return a
        pointer to a "nil" surface if other is already in an error state
        or any other error occurs. If the returned pointer does not have an
        error status, it is guaranteed to be an image surface whose format
        is not [cairo.types.Format.Invalid].
  */
  cairo.surface.Surface mapToImage(cairo.types.RectangleInt extents)
  {
    cairo_surface_t* _cretval;
    _cretval = cairo_surface_map_to_image(cast(cairo_surface_t*)this._cPtr, &extents);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tells cairo that drawing has been done to surface using means other
      than cairo, and that cairo should reread any cached areas. Note
      that you must call [cairo.surface.Surface.flush] before doing such drawing.
  */
  void markDirty()
  {
    cairo_surface_mark_dirty(cast(cairo_surface_t*)this._cPtr);
  }

  /**
      Like [cairo.surface.Surface.markDirty], but drawing has been done only to
      the specified rectangle, so that cairo can retain cached contents
      for other parts of the surface.
      
      Any cached clip set on the surface will be reset by this function,
      to make sure that future cairo calls have the clip set that they
      expect.
  
      Params:
        x = X coordinate of dirty rectangle
        y = Y coordinate of dirty rectangle
        width = width of dirty rectangle
        height = height of dirty rectangle
  */
  void markDirtyRectangle(int x, int y, int width, int height)
  {
    cairo_surface_mark_dirty_rectangle(cast(cairo_surface_t*)this._cPtr, x, y, width, height);
  }

  /**
      Returns the total observation time.
      Returns: the elapsed time, in nanoseconds
  */
  double observerElapsed()
  {
    double _retval;
    _retval = cairo_surface_observer_elapsed(cast(cairo_surface_t*)this._cPtr);
    return _retval;
  }

  /**
      Prints the observer log using the given callback.
  
      Params:
        writeFunc = callback for writing on a stream
      Returns: the status of the print operation
  */
  cairo.types.Status observerPrint(cairo.types.WriteFunc writeFunc)
  {
    extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length)
    {
      cairo.types.Status _dretval;
      auto _dlg = cast(cairo.types.WriteFunc*)closure;
      ubyte[] _data;
      _data.length = length;
      _data[0 .. length] = data[0 .. length];

      _dretval = (*_dlg)(_data);
      auto _retval = cast(cairo_status_t)_dretval;

      return _retval;
    }
    auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
    cairo_status_t _cretval;
    auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
    _cretval = cairo_surface_observer_print(cast(cairo_surface_t*)this._cPtr, _writeFuncCB, _writeFunc);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Sets an offset that is added to the device coordinates determined
      by the CTM when drawing to surface. One use case for this function
      is when we want to create a #cairo_surface_t that redirects drawing
      for a portion of an onscreen surface to an offscreen surface in a
      way that is completely invisible to the user of the cairo
      API. Setting a transformation via [cairo.context.Context.translate] isn't
      sufficient to do this, since functions like
      [cairo.context.Context.deviceToUser] will expose the hidden offset.
      
      Note that the offset affects drawing to the surface as well as
      using the surface in a source pattern.
  
      Params:
        xOffset = the offset in the X direction, in device units
        yOffset = the offset in the Y direction, in device units
  */
  void setDeviceOffset(double xOffset, double yOffset)
  {
    cairo_surface_set_device_offset(cast(cairo_surface_t*)this._cPtr, xOffset, yOffset);
  }

  /**
      Sets a scale that is multiplied to the device coordinates determined
      by the CTM when drawing to surface. One common use for this is to
      render to very high resolution display devices at a scale factor, so
      that code that assumes 1 pixel will be a certain size will still work.
      Setting a transformation via [cairo.context.Context.scale] isn't
      sufficient to do this, since functions like
      [cairo.context.Context.deviceToUser] will expose the hidden scale.
      
      Note that the scale affects drawing to the surface as well as
      using the surface in a source pattern.
  
      Params:
        xScale = a scale factor in the X direction
        yScale = a scale factor in the Y direction
  */
  void setDeviceScale(double xScale, double yScale)
  {
    cairo_surface_set_device_scale(cast(cairo_surface_t*)this._cPtr, xScale, yScale);
  }

  /**
      Set the horizontal and vertical resolution for image fallbacks.
      
      When certain operations aren't supported natively by a backend,
      cairo will fallback by rendering operations to an image and then
      overlaying that image onto the output. For backends that are
      natively vector-oriented, this function can be used to set the
      resolution used for these image fallbacks, (larger values will
      result in more detailed images, but also larger file sizes).
      
      Some examples of natively vector-oriented backends are the ps, pdf,
      and svg backends.
      
      For backends that are natively raster-oriented, image fallbacks are
      still possible, but they are always performed at the native
      device resolution. So this function has no effect on those
      backends.
      
      Note: The fallback resolution only takes effect at the time of
      completing a page (with [cairo.context.Context.showPage] or [cairo.context.Context.copyPage]) so
      there is currently no way to have more than one fallback resolution
      in effect on a single page.
      
      The default fallback resolution is 300 pixels per inch in both
      dimensions.
  
      Params:
        xPixelsPerInch = horizontal setting for pixels per inch
        yPixelsPerInch = vertical setting for pixels per inch
  */
  void setFallbackResolution(double xPixelsPerInch, double yPixelsPerInch)
  {
    cairo_surface_set_fallback_resolution(cast(cairo_surface_t*)this._cPtr, xPixelsPerInch, yPixelsPerInch);
  }

  /**
      Attach an image in the format mime_type to surface. To remove
      the data from a surface, call this function with same mime type
      and null for data.
      
      The attached image (or filename) data can later be used by backends
      which support it (currently: PDF, PS, SVG and Win32 Printing
      surfaces) to emit this data instead of making a snapshot of the
      surface.  This approach tends to be faster and requires less
      memory and disk space.
      
      The recognized MIME types are the following: [cairo.types.MIME_TYPE_JPEG],
      [cairo.types.MIME_TYPE_PNG], [cairo.types.MIME_TYPE_JP2], [cairo.types.MIME_TYPE_URI],
      [cairo.types.MIME_TYPE_UNIQUE_ID], [cairo.types.MIME_TYPE_JBIG2],
      [cairo.types.MIME_TYPE_JBIG2_GLOBAL], [cairo.types.MIME_TYPE_JBIG2_GLOBAL_ID],
      [cairo.types.MIME_TYPE_CCITT_FAX], [cairo.types.MIME_TYPE_CCITT_FAX_PARAMS].
      
      See corresponding backend surface docs for details about which MIME
      types it can handle. Caution: the associated MIME data will be
      discarded if you draw on the surface afterwards. Use this function
      with care.
      
      Even if a backend supports a MIME type, that does not mean cairo
      will always be able to use the attached MIME data. For example, if
      the backend does not natively support the compositing operation used
      to apply the MIME data to the backend. In that case, the MIME data
      will be ignored. Therefore, to apply an image in all cases, it is best
      to create an image surface which contains the decoded image data and
      then attach the MIME data to that. This ensures the image will always
      be used while still allowing the MIME data to be used whenever
      possible.
  
      Params:
        mimeType = the MIME type of the image data
        data = the image data to attach to the surface
        destroy = a #cairo_destroy_func_t which will be called when the
          surface is destroyed or when new image data is attached using the
          same mime type.
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory] if a
        slot could not be allocated for the user data.
  */
  cairo.types.Status setMimeData(string mimeType, ubyte[] data, cairo.types.DestroyFunc destroy)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(cairo.types.DestroyFunc*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    cairo_status_t _cretval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    gulong _length;
    if (data)
      _length = cast(gulong)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    auto _destroy = destroy ? freezeDelegate(cast(void*)&destroy) : null;
    _cretval = cairo_surface_set_mime_data(cast(cairo_surface_t*)this._cPtr, _mimeType, _data, _length, _destroyCB, _destroy);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Emits and clears the current page for backends that support multiple
      pages.  Use [cairo.surface.Surface.copyPage] if you don't want to clear the page.
      
      There is a convenience function for this that takes a #cairo_t,
      namely [cairo.context.Context.showPage].
  */
  void showPage()
  {
    cairo_surface_show_page(cast(cairo_surface_t*)this._cPtr);
  }

  /**
      Checks whether an error has previously occurred for this
      surface.
      Returns: [cairo.types.Status.Success], [cairo.types.Status.NullPointer],
        [cairo.types.Status.NoMemory], [cairo.types.Status.ReadError],
        [cairo.types.Status.InvalidContent], [cairo.types.Status.InvalidFormat], or
        [cairo.types.Status.InvalidVisual].
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_surface_status(cast(cairo_surface_t*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Return whether surface supports mime_type.
  
      Params:
        mimeType = the mime type
      Returns: true if surface supports
                      mime_type, false otherwise
  */
  cairo.types.Bool supportsMimeType(string mimeType)
  {
    cairo.types.Bool _retval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    _retval = cairo_surface_supports_mime_type(cast(cairo_surface_t*)this._cPtr, _mimeType);
    return _retval;
  }

  /**
      Unmaps the image surface as returned from #[cairo.surface.Surface.mapToImage].
      
      The content of the image will be uploaded to the target surface.
      Afterwards, the image is destroyed.
      
      Using an image surface which wasn't returned by [cairo.surface.Surface.mapToImage]
      results in undefined behavior.
  
      Params:
        image = the currently mapped image
  */
  void unmapImage(cairo.surface.Surface image)
  {
    cairo_surface_unmap_image(cast(cairo_surface_t*)this._cPtr, image ? cast(cairo_surface_t*)image._cPtr(No.Dup) : null);
  }

  /**
      Writes the contents of surface to a new file filename as a PNG
      image.
  
      Params:
        filename = the name of a file to write to; on Windows this filename
            is encoded in UTF-8.
      Returns: [cairo.types.Status.Success] if the PNG file was written
        successfully. Otherwise, [cairo.types.Status.NoMemory] if memory could not
        be allocated for the operation or
        [cairo.types.Status.SurfaceTypeMismatch] if the surface does not have
        pixel contents, or [cairo.types.Status.WriteError] if an I/O error occurs
        while attempting to write the file, or [cairo.types.Status.PngError] if libpng
        returned an error.
  */
  cairo.types.Status writeToPng(string filename)
  {
    cairo_status_t _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = cairo_surface_write_to_png(cast(cairo_surface_t*)this._cPtr, _filename);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Writes the image surface to the write function.
  
      Params:
        writeFunc = a #cairo_write_func_t
      Returns: [cairo.types.Status.Success] if the PNG file was written
        successfully.  Otherwise, [cairo.types.Status.NoMemory] is returned if
        memory could not be allocated for the operation,
        [cairo.types.Status.SurfaceTypeMismatch] if the surface does not have
        pixel contents, or [cairo.types.Status.PngError] if libpng
        returned an error.
  */
  cairo.types.Status writeToPngStream(cairo.types.WriteFunc writeFunc)
  {
    extern(C) cairo_status_t _writeFuncCallback(void* closure, const(ubyte)* data, uint length)
    {
      cairo.types.Status _dretval;
      auto _dlg = cast(cairo.types.WriteFunc*)closure;
      ubyte[] _data;
      _data.length = length;
      _data[0 .. length] = data[0 .. length];

      _dretval = (*_dlg)(_data);
      auto _retval = cast(cairo_status_t)_dretval;

      return _retval;
    }
    auto _writeFuncCB = writeFunc ? &_writeFuncCallback : null;
    cairo_status_t _cretval;
    auto _writeFunc = writeFunc ? cast(void*)&(writeFunc) : null;
    _cretval = cairo_surface_write_to_png_stream(cast(cairo_surface_t*)this._cPtr, _writeFuncCB, _writeFunc);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }
}
