/// Module for [Style] class
module gid.gtksource5.style;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_tag;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;
import gid.pango1.types;

/**
    Represents a style.
    
    The [gid.gtksource5.style.Style] structure is used to describe text attributes
    which are set when given style is used.
*/
class Style : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_style_get_type != &gidSymbolNotFound ? gtk_source_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceStyle";
  }

  /** Returns `this`, for use in `with` statements. */
  override Style self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.style.Style]
      Returns: New builder object
  */
  static StyleGidBuilder builder() nothrow
  {
    return new StyleGidBuilder;
  }

  /** */
  @property string background() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("background");
  }

  /** */
  @property bool backgroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property bool bold() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("bold");
  }

  /** */
  @property bool boldSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("bold-set");
  }

  /** */
  @property string foreground() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("foreground");
  }

  /** */
  @property bool foregroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property bool italic() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("italic");
  }

  /** */
  @property bool italicSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("italic-set");
  }

  /** */
  @property string lineBackground() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("line-background");
  }

  /** */
  @property bool lineBackgroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("line-background-set");
  }

  /** */
  @property gid.pango1.types.Underline pangoUnderline() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Underline)("pango-underline");
  }

  /** */
  @property string scale() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("scale");
  }

  /** */
  @property bool scaleSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property bool strikethrough() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property bool strikethroughSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property string underlineColor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("underline-color");
  }

  /** */
  @property bool underlineColorSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("underline-color-set");
  }

  /** */
  @property bool underlineSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /** */
  @property gid.pango1.types.Weight weight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.types.Weight)("weight");
  }

  /** */
  @property bool weightSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("weight-set");
  }

  /**
      This function modifies the [gid.gtk4.text_tag.TextTag] properties that are related to the
      #GtkSourceStyle properties. Other [gid.gtk4.text_tag.TextTag] properties are left untouched.
      
      If style is non-null, applies style to tag.
      
      If style is null, the related *-set properties of [gid.gtk4.text_tag.TextTag] are set to
      false.
  
      Params:
        tag = a #GtkTextTag to apply styles to.
  */
  void apply(gid.gtk4.text_tag.TextTag tag) nothrow
  {
    gtk_source_style_apply(cast(const(GtkSourceStyle)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Creates a copy of style, that is a new #GtkSourceStyle instance which
      has the same attributes set.
      Returns: copy of style, call [gid.gobject2.object.ObjectWrap.unref]
        when you are done with it.
  */
  gid.gtksource5.style.Style copy() nothrow
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_style_copy(cast(const(GtkSourceStyle)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.style.Style)(cast(GtkSourceStyle*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.style.Style]
class StyleGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
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
  T pangoUnderline(gid.pango1.types.Underline propval) nothrow
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
  T weight(gid.pango1.types.Weight propval) nothrow
  {
    return setProperty("weight", propval);
  }

  /** */
  T weightSet(bool propval) nothrow
  {
    return setProperty("weight-set", propval);
  }
}

/// Fluent builder for [gid.gtksource5.style.Style]
final class StyleGidBuilder : StyleGidBuilderImpl!StyleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Style build() nothrow
  {
    return new Style(cast(void*)createGObject(Style._getGType), Yes.Take);
  }
}
