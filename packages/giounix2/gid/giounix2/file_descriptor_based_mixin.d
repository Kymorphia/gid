/// Module for [FileDescriptorBased] interface mixin
module gid.giounix2.file_descriptor_based_mixin;

public import gid.core.basictypes;
public import gid.giounix2.file_descriptor_based_iface_proxy;
public import gid.core.utils;
public import gid.giounix2.c.functions;
public import gid.giounix2.c.types;
public import gid.giounix2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.giounix2.file_descriptor_based.FileDescriptorBased] is an interface for file descriptor based IO.
    
    It is implemented by streams (implementations of [gid.gio2.input_stream.InputStream] or
    [gid.gio2.output_stream.OutputStream]) that are based on file descriptors.
    
    Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
    GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
    file or the `GioUnix-2.0` GIR namespace when using it.
*/
template FileDescriptorBasedT()
{

  /**
      Gets the underlying file descriptor.
      Returns: The file descriptor
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFd`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetFd()
  {
    auto _klass = cast(GFileDescriptorBasedIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.giounix2.file_descriptor_based.FileDescriptorBased._getGType);
    if (!_klass || !_klass.getFd)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getFd(cast(GFileDescriptorBased*)this._cPtr);
    return _retval;
  }

  /**
      Gets the underlying file descriptor.
      Returns: The file descriptor
  */
  override int getFd() nothrow
  {
    int _retval;
    _retval = g_file_descriptor_based_get_fd(cast(GFileDescriptorBased*)this._cPtr);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.giounix2.file_descriptor_based.FileDescriptorBased (DiG)
  enum bool _ifaceVfuncsOverridden_gid_giounix2_file_descriptor_based_FileDescriptorBased(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFd", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.giounix2.file_descriptor_based.FileDescriptorBased vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_giounix2_file_descriptor_based_FileDescriptorBased(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFd", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_giounix2_file_descriptor_based_FileDescriptorBased(iface, "get_fd");
  }

  private static void _installIfaceVfunc_gid_giounix2_file_descriptor_based_FileDescriptorBased(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GFileDescriptorBasedIface*)iface;

    switch (vfunc)
    {
      case "get_fd":
      {
        static extern(C) int _vfuncGetFdTramp(GFileDescriptorBased* fdBased) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fdBased);
          if (!_obj)
          {
            auto _klass = cast(GFileDescriptorBasedIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fdBased), gid.giounix2.file_descriptor_based.FileDescriptorBased._getGType);
            if (_klass && _klass.getFd)
              return (cast(typeof(&_vfuncGetFdTramp))_klass.getFd)(fdBased);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetFd();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.giounix2.file_descriptor_based.FileDescriptorBased.vfuncGetFd");
          }
          return _retval;
        }

        _klass.getFd = cast(typeof(_klass.getFd))&_vfuncGetFdTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.giounix2.file_descriptor_based.FileDescriptorBased]
template FileDescriptorBasedGidBuilderT()
{
}
