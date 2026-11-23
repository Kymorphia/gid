/// Module for [AudioFilter] class
module gid.gstaudio1.audio_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstaudio1.audio_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.base_transform;

/**
    #GstAudioFilter is a #GstBaseTransform<!-- -->-derived base class for simple audio
    filters, ie. those that output the same format that they get as input.
    
    #GstAudioFilter will parse the input format for you (with error checking)
    before calling your setup function. Also, elements deriving from
    #GstAudioFilter may use [gid.gstaudio1.audio_filter_class.AudioFilterClass.addPadTemplates] from
    their class_init function to easily configure the set of caps/formats that
    the element is able to handle.
    
    Derived classes should override the #GstAudioFilterClass.setup() and
    #GstBaseTransformClass.transform_ip() and/or
    #GstBaseTransformClass.transform()
    virtual functions in their class_init function.
*/
class AudioFilter : gid.gstbase1.base_transform.BaseTransform
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_filter_get_type != &gidSymbolNotFound ? gst_audio_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_filter.AudioFilter]
      Returns: New builder object
  */
  static AudioFilterGidBuilder builder() nothrow
  {
    return new AudioFilterGidBuilder;
  }

  /**
      virtual function called whenever the format changes
  
      Params:
        info = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetup` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetup(gid.gstaudio1.audio_info.AudioInfo info)
  {
    auto _klass = cast(GstAudioFilterClass*)_vfuncClass;
    if (!_klass.setup)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setup(cast(GstAudioFilter*)this._cPtr, info ? cast(const(GstAudioInfo)*)info._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioFilter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_filter.AudioFilter), T.stringof ~ " is not derived from gid.gstaudio1.audio_filter.AudioFilter");

    gid.gstbase1.base_transform.BaseTransform._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetup", true)[0]) == gid.gstaudio1.audio_filter.AudioFilter))
      _installVfunc(klass, "setup");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioFilterClass*)klass;

    switch (vfunc)
    {
      case "setup":
      {
        static extern(C) gboolean _vfuncSetupTramp(GstAudioFilter* filter, const(GstAudioInfo)* info) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_filter.AudioFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstAudioFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.setup)
              return (cast(typeof(&_vfuncSetupTramp))_klass.setup)(filter, info);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetup(info ? new gid.gstaudio1.audio_info.AudioInfo(cast(void*)info, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_filter.AudioFilter.vfuncSetup");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setup = cast(typeof(_klass.setup))&_vfuncSetupTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_filter.AudioFilter]
class AudioFilterGidBuilderImpl(T) : gid.gstbase1.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstaudio1.audio_filter.AudioFilter]
final class AudioFilterGidBuilder : AudioFilterGidBuilderImpl!AudioFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioFilter build() nothrow
  {
    return new AudioFilter(cast(void*)createGObject(AudioFilter._getGType), Yes.Take);
  }
}
