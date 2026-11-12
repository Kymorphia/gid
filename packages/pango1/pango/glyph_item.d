/// Module for [GlyphItem] class
module pango.glyph_item;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import pango.attr_list;
import pango.c.functions;
import pango.c.types;
import pango.glyph_string;
import pango.item;
import pango.types;

/**
    A [pango.glyph_item.GlyphItem] is a pair of a [pango.item.Item] and the glyphs
    resulting from shaping the items text.
    
    As an example of the usage of [pango.glyph_item.GlyphItem], the results
    of shaping text with [pango.layout.Layout] is a list of [pango.layout_line.LayoutLine],
    each of which contains a list of [pango.glyph_item.GlyphItem].
*/
class GlyphItem : gobject.boxed.BoxedWrap!(pango_glyph_item_get_type)
{
  /**
      Create a `glyph_item.GlyphItem` boxed type.
      Params:
        yOffset = shift of the baseline, relative to the baseline
            of the containing line. Positive values shift upwards
        startXOffset = horizontal displacement to apply before the
            glyph item. Positive values shift right
        endXOffset = horizontal displacement to apply after th
            glyph item. Positive values shift right
  */
  this(int yOffset = int.init, int startXOffset = int.init, int endXOffset = int.init) nothrow
  {
    super(boxedNew!PangoGlyphItem(_getGType), Yes.Take);
    this.yOffset = yOffset;
    this.startXOffset = startXOffset;
    this.endXOffset = endXOffset;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphItem self() nothrow
  {
    return this;
  }

  /**
      Get `item` field.
      Returns: corresponding [pango.item.Item]
  */
  @property pango.item.Item item() nothrow
  {
    return cToD!(pango.item.Item)(cast(void*)(cast(PangoGlyphItem*)this._cPtr).item);
  }

  /**
      Get `glyphs` field.
      Returns: corresponding [pango.glyph_string.GlyphString]
  */
  @property pango.glyph_string.GlyphString glyphs() nothrow
  {
    return cToD!(pango.glyph_string.GlyphString)(cast(void*)(cast(PangoGlyphItem*)this._cPtr).glyphs);
  }

  /**
      Get `yOffset` field.
      Returns: shift of the baseline, relative to the baseline
          of the containing line. Positive values shift upwards
  */
  @property int yOffset() nothrow
  {
    return (cast(PangoGlyphItem*)this._cPtr).yOffset;
  }

  /**
      Set `yOffset` field.
      Params:
        propval = shift of the baseline, relative to the baseline
            of the containing line. Positive values shift upwards
  */
  @property void yOffset(int propval) nothrow
  {
    (cast(PangoGlyphItem*)this._cPtr).yOffset = propval;
  }

  /**
      Get `startXOffset` field.
      Returns: horizontal displacement to apply before the
          glyph item. Positive values shift right
  */
  @property int startXOffset() nothrow
  {
    return (cast(PangoGlyphItem*)this._cPtr).startXOffset;
  }

  /**
      Set `startXOffset` field.
      Params:
        propval = horizontal displacement to apply before the
            glyph item. Positive values shift right
  */
  @property void startXOffset(int propval) nothrow
  {
    (cast(PangoGlyphItem*)this._cPtr).startXOffset = propval;
  }

  /**
      Get `endXOffset` field.
      Returns: horizontal displacement to apply after th
          glyph item. Positive values shift right
  */
  @property int endXOffset() nothrow
  {
    return (cast(PangoGlyphItem*)this._cPtr).endXOffset;
  }

  /**
      Set `endXOffset` field.
      Params:
        propval = horizontal displacement to apply after th
            glyph item. Positive values shift right
  */
  @property void endXOffset(int propval) nothrow
  {
    (cast(PangoGlyphItem*)this._cPtr).endXOffset = propval;
  }

  /**
  Given a glyph item and the corresponding text, determine the width corresponding to each character.
  When multiple characters compose a single cluster, the width of the entire cluster is divided equally among the
  characters.
  See also [pango.glyph_string.GlyphString.getLogicalWidths].
  Params:
  text = text that the glyph item corresponds to (the item offset is an offset from the start of text)
  Returns: the logical widths, one for each character of the item, or null if text is too short for the item
  */
  int[] getLogicalWidths(string text) nothrow
  {
    auto item = (cast(PangoGlyphItem*)this._cPtr).item;

    if (!item || item.numChars <= 0 || text.length < cast(size_t)item.offset + item.length)
      return null;

    auto widths = new int[item.numChars];
    pango_glyph_item_get_logical_widths(cast(PangoGlyphItem*)this._cPtr, text.ptr, widths.ptr);
    return widths;
  }

  /**
  Adds spacing between the graphemes of the glyph item to give the effect of typographic letter spacing.
  Params:
  text = text that the glyph item corresponds to (the item offset is an offset from the start of text)
  logAttrs = logical attributes for the item, the first logical attribute refers to the position before the first
  character in the item (at least the item's number of characters + 1 elements, see
  [pango.global.getLogAttrs] and [pango.layout.Layout.getLogAttrsReadonly])
  letterSpacing = amount of letter spacing to add in Pango units, may be negative, though too large negative
  values will give ugly results
  Returns: true on success, false if text or logAttrs is too short for the item (nothing is done)
  */
  bool letterSpace(string text, pango.types.LogAttr[] logAttrs, int letterSpacing) nothrow
  {
    auto item = (cast(PangoGlyphItem*)this._cPtr).item;

    if (!item || text.length < cast(size_t)item.offset + item.length || logAttrs.length < cast(size_t)item.numChars + 1)
      return false;

    pango_glyph_item_letter_space(cast(PangoGlyphItem*)this._cPtr, text.ptr, logAttrs.ptr, letterSpacing);
    return true;
  }


  /**
      Splits a shaped item ([pango.glyph_item.GlyphItem]) into multiple items based
      on an attribute list.
      
      The idea is that if you have attributes that don't affect shaping,
      such as color or underline, to avoid affecting shaping, you filter
      them out ([pango.attr_list.AttrList.filter]), apply the shaping process
      and then reapply them to the result using this function.
      
      All attributes that start or end inside a cluster are applied
      to that cluster; for instance, if half of a cluster is underlined
      and the other-half strikethrough, then the cluster will end
      up with both underline and strikethrough attributes. In these
      cases, it may happen that item->extra_attrs for some of the
      result items can have multiple attributes of the same type.
      
      This function takes ownership of glyph_item; it will be reused
      as one of the elements in the list.
  
      Params:
        text = text that list applies to
        list = a [pango.attr_list.AttrList]
      Returns: a
          list of glyph items resulting from splitting glyph_item. Free
          the elements using [pango.glyph_item.GlyphItem.free], the list using
          [glib.slist.SList.free].
  */
  pango.glyph_item.GlyphItem[] applyAttrs(string text, pango.attr_list.AttrList list) nothrow
  {
    GSList* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _cretval = pango_glyph_item_apply_attrs(cast(PangoGlyphItem*)this._cPtr(Yes.Dup), _text, list ? cast(PangoAttrList*)list._cPtr(No.Dup) : null);
    auto _retval = gSListToD!(pango.glyph_item.GlyphItem, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Make a deep copy of an existing [pango.glyph_item.GlyphItem] structure.
      Returns: the newly allocated [pango.glyph_item.GlyphItem]
  */
  pango.glyph_item.GlyphItem copy() nothrow
  {
    PangoGlyphItem* _cretval;
    _cretval = pango_glyph_item_copy(cast(PangoGlyphItem*)this._cPtr);
    auto _retval = _cretval ? new pango.glyph_item.GlyphItem(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Modifies orig to cover only the text after split_index, and
      returns a new item that covers the text before split_index that
      used to be in orig.
      
      You can think of split_index as the length of the returned item.
      split_index may not be 0, and it may not be greater than or equal
      to the length of orig (that is, there must be at least one byte
      assigned to each item, you can't create a zero-length item).
      
      This function is similar in function to [pango.item.Item.split] (and uses
      it internally.)
  
      Params:
        text = text to which positions in orig apply
        splitIndex = byte index of position to split item, relative to the
            start of the item
      Returns: the newly allocated item
          representing text before split_index, which should be freed
          with [pango.glyph_item.GlyphItem.free].
  */
  pango.glyph_item.GlyphItem split(string text, int splitIndex) nothrow
  {
    PangoGlyphItem* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _cretval = pango_glyph_item_split(cast(PangoGlyphItem*)this._cPtr, _text, splitIndex);
    auto _retval = _cretval ? new pango.glyph_item.GlyphItem(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
