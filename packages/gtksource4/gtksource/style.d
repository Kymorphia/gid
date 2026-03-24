/// Module for [Style] class
module gtksource.style;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import pango.types;

/** */
class Style : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_get_type != &gidSymbolNotFound ? gtk_source_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Style self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.style.Style]
  Returns: New builder object
  */
  static StyleGidBuilder builder()
  {
    return new StyleGidBuilder;
  }

  /** */
  @property string background()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("background");
  }

  /** */
  @property bool backgroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property bool bold()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("bold");
  }

  /** */
  @property bool boldSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("bold-set");
  }

  /** */
  @property string foreground()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("foreground");
  }

  /** */
  @property bool foregroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property bool italic()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("italic");
  }

  /** */
  @property bool italicSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("italic-set");
  }

  /** */
  @property string lineBackground()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("line-background");
  }

  /** */
  @property bool lineBackgroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("line-background-set");
  }

  /** */
  @property pango.types.Underline pangoUnderline()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("pango-underline");
  }

  /** */
  @property string scale()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("scale");
  }

  /** */
  @property bool scaleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property bool strikethrough()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property bool strikethroughSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property string underlineColor()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("underline-color");
  }

  /** */
  @property bool underlineColorSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-color-set");
  }

  /** */
  @property bool underlineSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /**
      This function modifies the #GtkTextTag properties that are related to the
      #GtkSourceStyle properties. Other #GtkTextTag properties are left untouched.
      
      If style is non-null, applies style to tag.
      
      If style is null, the related *-set properties of #GtkTextTag are set to
      false.
  
      Params:
        tag = a #GtkTextTag to apply styles to.
  */
  void apply(gtk.text_tag.TextTag tag)
  {
    gtk_source_style_apply(cast(const(GtkSourceStyle)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Creates a copy of style, that is a new #GtkSourceStyle instance which
      has the same attributes set.
      Returns: copy of style, call [gobject.object.ObjectWrap.unref]
        when you are done with it.
  */
  gtksource.style.Style copy()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_style_copy(cast(const(GtkSourceStyle)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, Yes.Take);
    return _retval;
  }
}

class StyleGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T background(string propval)
  {
    return setProperty("background", propval);
  }

  /** */
  T backgroundSet(bool propval)
  {
    return setProperty("background-set", propval);
  }

  /** */
  T bold(bool propval)
  {
    return setProperty("bold", propval);
  }

  /** */
  T boldSet(bool propval)
  {
    return setProperty("bold-set", propval);
  }

  /** */
  T foreground(string propval)
  {
    return setProperty("foreground", propval);
  }

  /** */
  T foregroundSet(bool propval)
  {
    return setProperty("foreground-set", propval);
  }

  /** */
  T italic(bool propval)
  {
    return setProperty("italic", propval);
  }

  /** */
  T italicSet(bool propval)
  {
    return setProperty("italic-set", propval);
  }

  /** */
  T lineBackground(string propval)
  {
    return setProperty("line-background", propval);
  }

  /** */
  T lineBackgroundSet(bool propval)
  {
    return setProperty("line-background-set", propval);
  }

  /** */
  T pangoUnderline(pango.types.Underline propval)
  {
    return setProperty("pango-underline", propval);
  }

  /** */
  T scale(string propval)
  {
    return setProperty("scale", propval);
  }

  /** */
  T scaleSet(bool propval)
  {
    return setProperty("scale-set", propval);
  }

  /** */
  T strikethrough(bool propval)
  {
    return setProperty("strikethrough", propval);
  }

  /** */
  T strikethroughSet(bool propval)
  {
    return setProperty("strikethrough-set", propval);
  }

  /** */
  T underlineColor(string propval)
  {
    return setProperty("underline-color", propval);
  }

  /** */
  T underlineColorSet(bool propval)
  {
    return setProperty("underline-color-set", propval);
  }

  /** */
  T underlineSet(bool propval)
  {
    return setProperty("underline-set", propval);
  }
}

/// Fluent builder for [gtksource.style.Style]
final class StyleGidBuilder : StyleGidBuilderImpl!StyleGidBuilder
{
  Style build()
  {
    return new Style(cast(void*)createGObject(Style._getGType), No.Take);
  }
}
