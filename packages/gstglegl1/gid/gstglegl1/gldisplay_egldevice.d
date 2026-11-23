/// Module for [GLDisplayEGLDevice] class
module gid.gstglegl1.gldisplay_egldevice;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstgl1.gldisplay;
import gid.gstglegl1.c.functions;
import gid.gstglegl1.c.types;
import gid.gstglegl1.types;

/**
    the contents of a #GstGLDisplayEGLDevice are private and should only be accessed
    through the provided API
*/
class GLDisplayEGLDevice : gid.gstgl1.gldisplay.GLDisplay
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_egl_device_get_type != &gidSymbolNotFound ? gst_gl_display_egl_device_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLDisplayEGLDevice";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplayEGLDevice self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstglegl1.gldisplay_egldevice.GLDisplayEGLDevice]
      Returns: New builder object
  */
  static GLDisplayEGLDeviceGidBuilder builder() nothrow
  {
    return new GLDisplayEGLDeviceGidBuilder;
  }

  /**
      Create a new #GstGLDisplayEGLDevice with an EGLDevice supported device
  
      Params:
        deviceIndex = the index of device to use
      Returns: a new #GstGLDisplayEGLDevice or null
  */
  this(uint deviceIndex) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstGLDisplayEGLDevice* _cretval;
      _cretval = gst_gl_display_egl_device_new(deviceIndex);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new #GstGLDisplayEGLDevice with EGLDeviceEXT .
      The device must be created using EGLDevice enumeration.
  
      Params:
        device = an existing EGLDeviceEXT
      Returns: a new #GstGLDisplayEGLDevice
  */
  static gid.gstglegl1.gldisplay_egldevice.GLDisplayEGLDevice newWithEglDevice(void* device = null) nothrow
  {
    GstGLDisplayEGLDevice* _cretval;
    _cretval = gst_gl_display_egl_device_new_with_egl_device(device);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstglegl1.gldisplay_egldevice.GLDisplayEGLDevice)(cast(GstGLDisplayEGLDevice*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstglegl1.gldisplay_egldevice.GLDisplayEGLDevice]
class GLDisplayEGLDeviceGidBuilderImpl(T) : gid.gstgl1.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstglegl1.gldisplay_egldevice.GLDisplayEGLDevice]
final class GLDisplayEGLDeviceGidBuilder : GLDisplayEGLDeviceGidBuilderImpl!GLDisplayEGLDeviceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLDisplayEGLDevice build() nothrow
  {
    return new GLDisplayEGLDevice(cast(void*)createGObject(GLDisplayEGLDevice._getGType), Yes.Take);
  }
}
