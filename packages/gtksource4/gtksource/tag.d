/// Module for [Tag] class
module gtksource.tag;

import gid.gid;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class Tag : gtk.text_tag.TextTag
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_tag_get_type != &gidSymbolNotFound ? gtk_source_tag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Tag self()
  {
    return this;
  }

  /**
      Get `drawSpaces` property.
      Returns: Whether to draw white spaces. This property takes precedence over the value
      defined by the GtkSourceSpaceDrawer's #GtkSourceSpaceDrawer:matrix property
      (only where the tag is applied).
      
      Setting this property also changes #GtkSourceTag:draw-spaces-set to
      true.
  */
  @property bool drawSpaces()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("draw-spaces");
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
  @property void drawSpaces(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("draw-spaces", propval);
  }

  /**
      Get `drawSpacesSet` property.
      Returns: Whether the #GtkSourceTag:draw-spaces property is set and must be
      taken into account.
  */
  @property bool drawSpacesSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("draw-spaces-set");
  }

  /**
      Set `drawSpacesSet` property.
      Params:
        propval = Whether the #GtkSourceTag:draw-spaces property is set and must be
        taken into account.
  */
  @property void drawSpacesSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("draw-spaces-set", propval);
  }

  /**
      Creates a #GtkSourceTag. Configure the tag using object arguments,
      i.e. using [gobject.object.ObjectWrap.set].
      
      For usual cases, [gtksource.buffer.Buffer.createSourceTag] is more convenient to
      use.
  
      Params:
        name = tag name, or null.
      Returns: a new #GtkSourceTag.
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_source_tag_new(_name);
    this(_cretval, Yes.Take);
  }
}
