/// Module for [TextAttributes] class
module gid.gtk3.text_attributes;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.text_appearance;
import gid.gtk3.types;
import gid.pango1.font_description;
import gid.pango1.language;
import gid.pango1.tab_array;

/**
    Using #GtkTextAttributes directly should rarely be necessary.
    It’s primarily useful with [gid.gtk3.text_iter.TextIter.getAttributes].
    As with most GTK+ structs, the fields in this struct should only
    be read, never modified directly.
*/
class TextAttributes : gid.gobject2.boxed.BoxedWrap!(gtk_text_attributes_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override TextAttributes self() nothrow
  {
    return this;
  }

  /**
      Get `appearance` field.
      Returns: #GtkTextAppearance for text.
  */
  @property gid.gtk3.text_appearance.TextAppearance appearance() nothrow
  {
    return new gid.gtk3.text_appearance.TextAppearance(cast(GtkTextAppearance*)&(cast(GtkTextAttributes*)this._cPtr).appearance, No.Take);
  }

  /**
      Get `justification` field.
      Returns: #GtkJustification for text.
  */
  @property gid.gtk3.types.Justification justification() nothrow
  {
    return cast(gid.gtk3.types.Justification)(cast(GtkTextAttributes*)this._cPtr).justification;
  }

  /**
      Set `justification` field.
      Params:
        propval = #GtkJustification for text.
  */
  @property void justification(gid.gtk3.types.Justification propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).justification = cast(GtkJustification)propval;
  }

  /**
      Get `direction` field.
      Returns: #GtkTextDirection for text.
  */
  @property gid.gtk3.types.TextDirection direction() nothrow
  {
    return cast(gid.gtk3.types.TextDirection)(cast(GtkTextAttributes*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = #GtkTextDirection for text.
  */
  @property void direction(gid.gtk3.types.TextDirection propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).direction = cast(GtkTextDirection)propval;
  }

  /**
      Get `font` field.
      Returns: #PangoFontDescription for text.
  */
  @property gid.pango1.font_description.FontDescription font() nothrow
  {
    return cToD!(gid.pango1.font_description.FontDescription)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).font);
  }

  /**
      Get `fontScale` field.
      Returns: Font scale factor.
  */
  @property double fontScale() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).fontScale;
  }

  /**
      Set `fontScale` field.
      Params:
        propval = Font scale factor.
  */
  @property void fontScale(double propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).fontScale = propval;
  }

  /**
      Get `leftMargin` field.
      Returns: Width of the left margin in pixels.
  */
  @property int leftMargin() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).leftMargin;
  }

  /**
      Set `leftMargin` field.
      Params:
        propval = Width of the left margin in pixels.
  */
  @property void leftMargin(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).leftMargin = propval;
  }

  /**
      Get `rightMargin` field.
      Returns: Width of the right margin in pixels.
  */
  @property int rightMargin() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).rightMargin;
  }

  /**
      Set `rightMargin` field.
      Params:
        propval = Width of the right margin in pixels.
  */
  @property void rightMargin(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).rightMargin = propval;
  }

  /**
      Get `indent` field.
      Returns: Amount to indent the paragraph, in pixels.
  */
  @property int indent() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).indent;
  }

  /**
      Set `indent` field.
      Params:
        propval = Amount to indent the paragraph, in pixels.
  */
  @property void indent(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).indent = propval;
  }

  /**
      Get `pixelsAboveLines` field.
      Returns: Pixels of blank space above paragraphs.
  */
  @property int pixelsAboveLines() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).pixelsAboveLines;
  }

  /**
      Set `pixelsAboveLines` field.
      Params:
        propval = Pixels of blank space above paragraphs.
  */
  @property void pixelsAboveLines(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).pixelsAboveLines = propval;
  }

  /**
      Get `pixelsBelowLines` field.
      Returns: Pixels of blank space below paragraphs.
  */
  @property int pixelsBelowLines() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).pixelsBelowLines;
  }

  /**
      Set `pixelsBelowLines` field.
      Params:
        propval = Pixels of blank space below paragraphs.
  */
  @property void pixelsBelowLines(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).pixelsBelowLines = propval;
  }

  /**
      Get `pixelsInsideWrap` field.
      Returns: Pixels of blank space between wrapped lines in
          a paragraph.
  */
  @property int pixelsInsideWrap() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).pixelsInsideWrap;
  }

  /**
      Set `pixelsInsideWrap` field.
      Params:
        propval = Pixels of blank space between wrapped lines in
            a paragraph.
  */
  @property void pixelsInsideWrap(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).pixelsInsideWrap = propval;
  }

  /**
      Get `tabs` field.
      Returns: Custom #PangoTabArray for this text.
  */
  @property gid.pango1.tab_array.TabArray tabs() nothrow
  {
    return cToD!(gid.pango1.tab_array.TabArray)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).tabs);
  }

  /**
      Get `wrapMode` field.
      Returns: #GtkWrapMode for text.
  */
  @property gid.gtk3.types.WrapMode wrapMode() nothrow
  {
    return cast(gid.gtk3.types.WrapMode)(cast(GtkTextAttributes*)this._cPtr).wrapMode;
  }

  /**
      Set `wrapMode` field.
      Params:
        propval = #GtkWrapMode for text.
  */
  @property void wrapMode(gid.gtk3.types.WrapMode propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).wrapMode = cast(GtkWrapMode)propval;
  }

  /**
      Get `language` field.
      Returns: #PangoLanguage for text.
  */
  @property gid.pango1.language.Language language() nothrow
  {
    return cToD!(gid.pango1.language.Language)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).language);
  }

  /**
      Get `invisible` field.
      Returns: Hide the text.
  */
  @property uint invisible() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).invisible;
  }

  /**
      Set `invisible` field.
      Params:
        propval = Hide the text.
  */
  @property void invisible(uint propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).invisible = propval;
  }

  /**
      Get `bgFullHeight` field.
      Returns: Background is fit to full line height rather than
           baseline +/- ascent/descent (font height).
  */
  @property uint bgFullHeight() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).bgFullHeight;
  }

  /**
      Set `bgFullHeight` field.
      Params:
        propval = Background is fit to full line height rather than
             baseline +/- ascent/descent (font height).
  */
  @property void bgFullHeight(uint propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).bgFullHeight = propval;
  }

  /**
      Get `editable` field.
      Returns: Can edit this text.
  */
  @property uint editable() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).editable;
  }

  /**
      Set `editable` field.
      Params:
        propval = Can edit this text.
  */
  @property void editable(uint propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).editable = propval;
  }

  /**
      Get `noFallback` field.
      Returns: Whether to disable font fallback.
  */
  @property uint noFallback() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).noFallback;
  }

  /**
      Set `noFallback` field.
      Params:
        propval = Whether to disable font fallback.
  */
  @property void noFallback(uint propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).noFallback = propval;
  }

  /**
      Get `letterSpacing` field.
      Returns: Extra space to insert between graphemes, in Pango units
  */
  @property int letterSpacing() nothrow
  {
    return (cast(GtkTextAttributes*)this._cPtr).letterSpacing;
  }

  /**
      Set `letterSpacing` field.
      Params:
        propval = Extra space to insert between graphemes, in Pango units
  */
  @property void letterSpacing(int propval) nothrow
  {
    (cast(GtkTextAttributes*)this._cPtr).letterSpacing = propval;
  }

  /**
      Creates a #GtkTextAttributes, which describes
      a set of properties on some text.
      Returns: a new #GtkTextAttributes,
            free with [gid.gtk3.text_attributes.TextAttributes.unref].
  */
  this() nothrow
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_attributes_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies src and returns a new #GtkTextAttributes.
      Returns: a copy of src,
            free with [gid.gtk3.text_attributes.TextAttributes.unref]
  */
  gid.gtk3.text_attributes.TextAttributes copy() nothrow
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_attributes_copy(cast(GtkTextAttributes*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.text_attributes.TextAttributes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies the values from src to dest so that dest has
      the same values as src. Frees existing values in dest.
  
      Params:
        dest = another #GtkTextAttributes
  */
  void copyValues(gid.gtk3.text_attributes.TextAttributes dest) nothrow
  {
    gtk_text_attributes_copy_values(cast(GtkTextAttributes*)this._cPtr, dest ? cast(GtkTextAttributes*)dest._cPtr(No.Dup) : null);
  }
}
