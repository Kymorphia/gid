/// Module for [Tag] class
module gtksource.tag;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    A tag that can be applied to text in a [gtksource.buffer.Buffer].
    
    [gtksource.tag.Tag] is a subclass of [gtk.text_tag.TextTag] that adds properties useful for
    the GtkSourceView library.
    
    If, for a certain tag, [gtk.text_tag.TextTag] is sufficient, it's better that you create
    a [gtk.text_tag.TextTag], not a [gtksource.tag.Tag].
*/
class Tag : gtk.text_tag.TextTag
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_tag_get_type != &gidSymbolNotFound ? gtk_source_tag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Tag self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.tag.Tag]
      Returns: New builder object
  */
  static TagGidBuilder builder() nothrow
  {
    return new TagGidBuilder;
  }

  /**
      Get `drawSpaces` property.
      Returns: Whether to draw white spaces.
        
        This property takes precedence over the value defined by the [gtksource.space_drawer.SpaceDrawer]'s
        [gtksource.space_drawer.SpaceDrawer.matrix] property (only where the tag is applied).
        
        Setting this property also changes [gtksource.tag.Tag.drawSpacesSet] to
        true.
  */
  @property bool drawSpaces() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("draw-spaces");
  }

  /**
      Set `drawSpaces` property.
      Params:
        propval = Whether to draw white spaces.
          
          This property takes precedence over the value defined by the [gtksource.space_drawer.SpaceDrawer]'s
          [gtksource.space_drawer.SpaceDrawer.matrix] property (only where the tag is applied).
          
          Setting this property also changes [gtksource.tag.Tag.drawSpacesSet] to
          true.
  */
  @property void drawSpaces(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("draw-spaces", propval);
  }

  /**
      Get `drawSpacesSet` property.
      Returns: Whether the [gtksource.tag.Tag.drawSpaces] property is set and must be
        taken into account.
  */
  @property bool drawSpacesSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("draw-spaces-set");
  }

  /**
      Set `drawSpacesSet` property.
      Params:
        propval = Whether the [gtksource.tag.Tag.drawSpaces] property is set and must be
          taken into account.
  */
  @property void drawSpacesSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("draw-spaces-set", propval);
  }

  /**
      Creates a [gtksource.tag.Tag].
      
      Configure the tag using object arguments, i.e. using [gobject.object.ObjectWrap.set].
      
      For usual cases, [gtksource.buffer.Buffer.createSourceTag] is more convenient to
      use.
  
      Params:
        name = tag name, or null.
      Returns: a new [gtksource.tag.Tag].
  */
  this(string name = null) nothrow
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_tag_new(_name);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gtksource.tag.Tag]
class TagGidBuilderImpl(T) : gtk.text_tag.TextTagGidBuilderImpl!T
{

  /**
      Set `drawSpaces` property.
      Params:
        propval = Whether to draw white spaces.
          
          This property takes precedence over the value defined by the [gtksource.space_drawer.SpaceDrawer]'s
          [gtksource.space_drawer.SpaceDrawer.matrix] property (only where the tag is applied).
          
          Setting this property also changes [gtksource.tag.Tag.drawSpacesSet] to
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
        propval = Whether the [gtksource.tag.Tag.drawSpaces] property is set and must be
          taken into account.
      Returns: Builder instance for fluent chaining
  */
  T drawSpacesSet(bool propval) nothrow
  {
    return setProperty("draw-spaces-set", propval);
  }
}

/// Fluent builder for [gtksource.tag.Tag]
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
