/// Module for [VideoAggregatorConvertPad] class
module gid.gstvideo1.video_aggregator_convert_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.structure;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_aggregator;
import gid.gstvideo1.video_aggregator_pad;
import gid.gstvideo1.video_info;

/**
    An implementation of GstPad that can be used with #GstVideoAggregator.
    
    See #GstVideoAggregator for more details.
*/
class VideoAggregatorConvertPad : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad
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
    return cast(void function())gst_video_aggregator_convert_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_convert_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoAggregatorConvertPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorConvertPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad]
      Returns: New builder object
  */
  static VideoAggregatorConvertPadGidBuilder builder() nothrow
  {
    return new VideoAggregatorConvertPadGidBuilder;
  }

  /** */
  @property gid.gst1.structure.Structure converterConfig() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.structure.Structure)("converter-config");
  }

  /** */
  @property void converterConfig(gid.gst1.structure.Structure propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.structure.Structure)("converter-config", propval);
  }

  /** */
  protected void vfuncCreateConversionInfo(gid.gstvideo1.video_aggregator.VideoAggregator agg, gid.gstvideo1.video_info.VideoInfo conversionInfo)
  {
    auto _klass = cast(GstVideoAggregatorConvertPadClass*)_vfuncClass;
    if (!_klass.createConversionInfo)
      return;

    _klass.createConversionInfo(cast(GstVideoAggregatorConvertPad*)this._cPtr, agg ? cast(GstVideoAggregator*)agg._cPtr(No.Dup) : null, conversionInfo ? cast(GstVideoInfo*)conversionInfo._cPtr(No.Dup) : null);
  }

  /**
      Requests the pad to check and update the converter before the next usage to
      update for any changes that have happened.
  */
  void updateConversionInfo() nothrow
  {
    gst_video_aggregator_convert_pad_update_conversion_info(cast(GstVideoAggregatorConvertPad*)this._cPtr);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoAggregatorConvertPad
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad), T.stringof ~ " is not derived from gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad");

    gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateConversionInfo", true)[0]) == gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad))
      _installVfunc(klass, "create_conversion_info");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoAggregatorConvertPadClass*)klass;

    switch (vfunc)
    {
      case "create_conversion_info":
      {
        static extern(C) void _vfuncCreateConversionInfoTramp(GstVideoAggregatorConvertPad* pad, GstVideoAggregator* agg, GstVideoInfo* conversionInfo) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorConvertPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.createConversionInfo)
              return (cast(typeof(&_vfuncCreateConversionInfoTramp))_klass.createConversionInfo)(pad, agg, conversionInfo);
            return;
          }

          auto _conversionInfo = conversionInfo ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)conversionInfo, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncCreateConversionInfo(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.video_aggregator.VideoAggregator)(cast(void*)agg, No.Take), _conversionInfo);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad.vfuncCreateConversionInfo");
          }
          if (_conversionInfo)
            _conversionInfo._cUnborrow;

        }

        _klass.createConversionInfo = cast(typeof(_klass.createConversionInfo))&_vfuncCreateConversionInfoTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad]
class VideoAggregatorConvertPadGidBuilderImpl(T) : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPadGidBuilderImpl!T
{

  /** */
  T converterConfig(gid.gst1.structure.Structure propval) nothrow
  {
    return setProperty("converter-config", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_aggregator_convert_pad.VideoAggregatorConvertPad]
final class VideoAggregatorConvertPadGidBuilder : VideoAggregatorConvertPadGidBuilderImpl!VideoAggregatorConvertPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregatorConvertPad build() nothrow
  {
    return new VideoAggregatorConvertPad(cast(void*)createGObject(VideoAggregatorConvertPad._getGType), Yes.Take);
  }
}
