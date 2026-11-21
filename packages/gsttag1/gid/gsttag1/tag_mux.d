/// Module for [TagMux] class
module gid.gsttag1.tag_mux;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gst1.element;
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
class TagMux : gid.gst1.element.Element, gid.gst1.tag_setter.TagSetter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
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
