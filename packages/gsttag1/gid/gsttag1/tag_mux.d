/// Module for [TagMux] class
module gid.gsttag1.tag_mux;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.element;
import gid.gst1.tag_list;
import gid.gst1.tag_setter;
import gid.gst1.tag_setter_mixin;
import gid.gsttag1.c.functions;
import gid.gsttag1.c.types;
import gid.gsttag1.types;

/**
    Provides a base class for adding tags at the beginning or end of a
    stream.
    
    ## Deriving from GstTagMux
    
    Subclasses have to do the following things:
    
     * In their base init function, they must add pad templates for the sink
       pad and the source pad to the element class, describing the media type
       they accept and output in the caps of the pad template.
     * In their class init function, they must override the
       GST_TAG_MUX_CLASS(mux_klass)->render_start_tag and/or
       GST_TAG_MUX_CLASS(mux_klass)->render_end_tag vfuncs and set up a render
       function.
*/
@gidGir("TagMux", "TagMuxClass")
class TagMux : gid.gst1.element.Element, gid.gst1.tag_setter.TagSetter
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
    return cast(void function())gst_tag_mux_get_type != &gidSymbolNotFound ? gst_tag_mux_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTagMux";
  }

  /** Returns `this`, for use in `with` statements. */
  override TagMux self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsttag1.tag_mux.TagMux]
      Returns: New builder object
  */
  static TagMuxGidBuilder builder() nothrow
  {
    return new TagMuxGidBuilder;
  }

  mixin TagSetterT!();

  /**
      create a tag buffer to add to the end of the
          input stream given a tag list, or NULL
  
      Params:
        tagList = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderEndTag` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncRenderEndTag(gid.gst1.tag_list.TagList tagList)
  {
    auto _klass = cast(GstTagMuxClass*)_vfuncClass;
    if (!_klass.renderEndTag)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.renderEndTag(cast(GstTagMux*)this._cPtr, tagList ? cast(const(GstTagList)*)tagList._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      create a tag buffer to add to the beginning of the
          input stream given a tag list, or NULL
  
      Params:
        tagList = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderStartTag` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncRenderStartTag(gid.gst1.tag_list.TagList tagList)
  {
    auto _klass = cast(GstTagMuxClass*)_vfuncClass;
    if (!_klass.renderStartTag)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.renderStartTag(cast(GstTagMux*)this._cPtr, tagList ? cast(const(GstTagList)*)tagList._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TagMux
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gsttag1.tag_mux.TagMux), T.stringof ~ " is not derived from gid.gsttag1.tag_mux.TagMux");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderEndTag", true)[0]) == gid.gsttag1.tag_mux.TagMux))
      _installVfunc(klass, "render_end_tag");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderStartTag", true)[0]) == gid.gsttag1.tag_mux.TagMux))
      _installVfunc(klass, "render_start_tag");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstTagMuxClass*)klass;

    switch (vfunc)
    {
      case "render_end_tag":
      {
        static extern(C) GstBuffer* _vfuncRenderEndTagTramp(GstTagMux* mux, const(GstTagList)* tagList) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gsttag1.tag_mux.TagMux)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)mux);
          if (!_obj)
          {
            auto _klass = cast(GstTagMuxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mux);
            if (_klass.renderEndTag)
              return (cast(typeof(&_vfuncRenderEndTagTramp))_klass.renderEndTag)(mux, tagList);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;

          try
          {
            _dretval = _obj.vfuncRenderEndTag(tagList ? new gid.gst1.tag_list.TagList(cast(void*)tagList, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gsttag1.tag_mux.TagMux.vfuncRenderEndTag");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.renderEndTag = cast(typeof(_klass.renderEndTag))&_vfuncRenderEndTagTramp;
        break;
      }
      case "render_start_tag":
      {
        static extern(C) GstBuffer* _vfuncRenderStartTagTramp(GstTagMux* mux, const(GstTagList)* tagList) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gsttag1.tag_mux.TagMux)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)mux);
          if (!_obj)
          {
            auto _klass = cast(GstTagMuxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mux);
            if (_klass.renderStartTag)
              return (cast(typeof(&_vfuncRenderStartTagTramp))_klass.renderStartTag)(mux, tagList);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;

          try
          {
            _dretval = _obj.vfuncRenderStartTag(tagList ? new gid.gst1.tag_list.TagList(cast(void*)tagList, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gsttag1.tag_mux.TagMux.vfuncRenderStartTag");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.renderStartTag = cast(typeof(_klass.renderStartTag))&_vfuncRenderStartTagTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gsttag1.tag_mux.TagMux]
class TagMuxGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T, gid.gst1.tag_setter.TagSetterGidBuilderImpl!T
{

  mixin TagSetterGidBuilderT!();
}

/// Fluent builder for [gid.gsttag1.tag_mux.TagMux]
final class TagMuxGidBuilder : TagMuxGidBuilderImpl!TagMuxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TagMux build() nothrow
  {
    return new TagMux(cast(void*)createGObject(TagMux._getGType), Yes.Take);
  }
}
