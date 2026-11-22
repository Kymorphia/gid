/// Module for [Tag] class
module gid.gtksource4.tag;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.text_tag;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/** */
class Tag : gid.gtk3.text_tag.TextTag
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
    return cast(void function())gtk_source_tag_get_type != &gidSymbolNotFound ? gtk_source_tag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceTag";
  }

  /** Returns `this`, for use in `with` statements. */
  override Tag self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource4.tag.Tag]
      Returns: New builder object
  */
  static TagGidBuilder builder() nothrow
  {
    return new TagGidBuilder;
  }

  /**
      Get `drawSpaces` property.
      Returns: Whether to draw white spaces. This property takes precedence over the value
        defined by the GtkSourceSpaceDrawer's #GtkSourceSpaceDrawer:matrix property
        (only where the tag is applied).
        
        Setting this property also changes #GtkSourceTag:draw-spaces-set to
        true.
  */
  @property bool drawSpaces() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("draw-spaces");
  }

  /**
      Set `drawSpaces` property.
      Params:
        propval = Whether to draw white spaces. This property takes precedence over the value
          defined by the GtkSourceSpaceDrawer's #GtkSourceSpaceDrawer:matrix property
          (only where the tag is applied).
          
          Setting this property also changes #GtkSourceTag:draw-spaces-set to
          true.
  */
  @property void drawSpaces(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("draw-spaces", propval);
  }

  /**
      Get `drawSpacesSet` property.
      Returns: Whether the #GtkSourceTag:draw-spaces property is set and must be
        taken into account.
  */
  @property bool drawSpacesSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("draw-spaces-set");
  }

  /**
      Set `drawSpacesSet` property.
      Params:
        propval = Whether the #GtkSourceTag:draw-spaces property is set and must be
          taken into account.
  */
  @property void drawSpacesSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("draw-spaces-set", propval);
  }

  /**
      Creates a #GtkSourceTag. Configure the tag using object arguments,
      i.e. using [gid.gobject2.object.ObjectWrap.set].
      
      For usual cases, [gid.gtksource5.buffer.Buffer.createSourceTag] is more convenient to
      use.
  
      Params:
        name = tag name, or null.
      Returns: a new #GtkSourceTag.
  */
  this(string name = null) nothrow
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_tag_new(_name);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.tag.Tag]
class TagGidBuilderImpl(T) : gid.gtk3.text_tag.TextTagGidBuilderImpl!T
{

  /**
      Set `drawSpaces` property.
      Params:
        propval = Whether to draw white spaces. This property takes precedence over the value
          defined by the GtkSourceSpaceDrawer's #GtkSourceSpaceDrawer:matrix property
          (only where the tag is applied).
          
          Setting this property also changes #GtkSourceTag:draw-spaces-set to
          true.
      Returns: Builder instance for fluent chaining
  */
  T drawSpaces(bool propval) nothrow
  {
    return setProperty("draw-spaces", propval);
  }

  /**
      Set `drawSpacesSet` property.
      Params:
        propval = Whether the #GtkSourceTag:draw-spaces property is set and must be
          taken into account.
      Returns: Builder instance for fluent chaining
  */
  T drawSpacesSet(bool propval) nothrow
  {
    return setProperty("draw-spaces-set", propval);
  }
}

/// Fluent builder for [gid.gtksource4.tag.Tag]
final class TagGidBuilder : TagGidBuilderImpl!TagGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Tag build() nothrow
  {
    return new Tag(cast(void*)createGObject(Tag._getGType), Yes.Take);
  }
}
