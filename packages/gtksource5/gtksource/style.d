/// Module for [Style] class
module gtksource.style;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import pango.types;

/**
    Represents a style.
    
    The [gtksource.style.Style] structure is used to describe text attributes
    which are set when given style is used.
*/
class Style : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_style_get_type != &gidSymbolNotFound ? gtk_source_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Style self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.style.Style]
      Returns: New builder object
  */
  static StyleGidBuilder builder() nothrow
  {
    return new StyleGidBuilder;
  }

  /** */
  @property string background() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("background");
  }

  /** */
  @property bool backgroundSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property bool bold() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("bold");
  }

  /** */
  @property bool boldSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("bold-set");
  }

  /** */
  @property string foreground() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("foreground");
  }

  /** */
  @property bool foregroundSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property bool italic() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("italic");
  }

  /** */
  @property bool italicSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("italic-set");
  }

  /** */
  @property string lineBackground() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("line-background");
  }

  /** */
  @property bool lineBackgroundSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("line-background-set");
  }

  /** */
  @property pango.types.Underline pangoUnderline() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("pango-underline");
  }

  /** */
  @property string scale() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("scale");
  }

  /** */
  @property bool scaleSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property bool strikethrough() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property bool strikethroughSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property string underlineColor() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("underline-color");
  }

  /** */
  @property bool underlineColorSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-color-set");
  }

  /** */
  @property bool underlineSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /** */
  @property pango.types.Weight weight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Weight)("weight");
  }

  /** */
  @property bool weightSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("weight-set");
  }

  /**
      This function modifies the [gtk.text_tag.TextTag] properties that are related to the
      #GtkSourceStyle properties. Other [gtk.text_tag.TextTag] properties are left untouched.
      
      If style is non-null, applies style to tag.
      
      If style is null, the related *-set properties of [gtk.text_tag.TextTag] are set to
      false.
  
      Params:
        tag = a #GtkTextTag to apply styles to.
  */
  void apply(gtk.text_tag.TextTag tag) nothrow
  {
    gtk_source_style_apply(cast(const(GtkSourceStyle)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Creates a copy of style, that is a new #GtkSourceStyle instance which
      has the same attributes set.
      Returns: copy of style, call [gobject.object.ObjectWrap.unref]
        when you are done with it.
  */
  gtksource.style.Style copy() nothrow
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_style_copy(cast(const(GtkSourceStyle)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtksource.style.Style]
class StyleGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T background(string propval) nothrow
  {
    return setProperty("background", propval);
  }

  /** */
  T backgroundSet(bool propval) nothrow
  {
    return setProperty("background-set", propval);
  }

  /** */
  T bold(bool propval) nothrow
  {
    return setProperty("bold", propval);
  }

  /** */
  T boldSet(bool propval) nothrow
  {
    return setProperty("bold-set", propval);
  }

  /** */
  T foreground(string propval) nothrow
  {
    return setProperty("foreground", propval);
  }

  /** */
  T foregroundSet(bool propval) nothrow
  {
    return setProperty("foreground-set", propval);
  }

  /** */
  T italic(bool propval) nothrow
  {
    return setProperty("italic", propval);
  }

  /** */
  T italicSet(bool propval) nothrow
  {
    return setProperty("italic-set", propval);
  }

  /** */
  T lineBackground(string propval) nothrow
  {
    return setProperty("line-background", propval);
  }

  /** */
  T lineBackgroundSet(bool propval) nothrow
  {
    return setProperty("line-background-set", propval);
  }

  /** */
  T pangoUnderline(pango.types.Underline propval) nothrow
  {
    return setProperty("pango-underline", propval);
  }

  /** */
  T scale(string propval) nothrow
  {
    return setProperty("scale", propval);
  }

  /** */
  T scaleSet(bool propval) nothrow
  {
    return setProperty("scale-set", propval);
  }

  /** */
  T strikethrough(bool propval) nothrow
  {
    return setProperty("strikethrough", propval);
  }

  /** */
  T strikethroughSet(bool propval) nothrow
  {
    return setProperty("strikethrough-set", propval);
  }

  /** */
  T underlineColor(string propval) nothrow
  {
    return setProperty("underline-color", propval);
  }

  /** */
  T underlineColorSet(bool propval) nothrow
  {
    return setProperty("underline-color-set", propval);
  }

  /** */
  T underlineSet(bool propval) nothrow
  {
    return setProperty("underline-set", propval);
  }

  /** */
  T weight(pango.types.Weight propval) nothrow
  {
    return setProperty("weight", propval);
  }

  /** */
  T weightSet(bool propval) nothrow
  {
    return setProperty("weight-set", propval);
  }
}

/// Fluent builder for [gtksource.style.Style]
final class StyleGidBuilder : StyleGidBuilderImpl!StyleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Style build() nothrow
  {
    return new Style(cast(void*)createGObject(Style._getGType), No.Take);
  }
}
