/// Module for [GlyphItem] class
module pango.glyph_item;

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
class GlyphItem : gobject.boxed.Boxed
{

  /**
      Create a `glyph_item.GlyphItem` boxed type.
      Params:
        item = corresponding [pango.item.Item]
        glyphs = corresponding [pango.glyph_string.GlyphString]
        yOffset = shift of the baseline, relative to the baseline
            of the containing line. Positive values shift upwards
        startXOffset = horizontal displacement to apply before the
            glyph item. Positive values shift right
        endXOffset = horizontal displacement to apply after th
            glyph item. Positive values shift right
  */
  this(pango.item.Item item = pango.item.Item.init, pango.glyph_string.GlyphString glyphs = pango.glyph_string.GlyphString.init, int yOffset = int.init, int startXOffset = int.init, int endXOffset = int.init)
  {
    super(gMalloc(PangoGlyphItem.sizeof), Yes.Take);
    this.item = item;
    this.glyphs = glyphs;
    this.yOffset = yOffset;
    this.startXOffset = startXOffset;
    this.endXOffset = endXOffset;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_glyph_item_get_type != &gidSymbolNotFound ? pango_glyph_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphItem self()
  {
    return this;
  }

  /**
      Get `item` field.
      Returns: corresponding [pango.item.Item]
  */
  @property pango.item.Item item()
  {
    return cToD!(pango.item.Item)(cast(void*)(cast(PangoGlyphItem*)this._cPtr).item);
  }

  /**
      Set `item` field.
      Params:
        propval = corresponding [pango.item.Item]
  */
  @property void item(pango.item.Item propval)
  {
    cValueFree!(pango.item.Item)(cast(void*)(cast(PangoGlyphItem*)this._cPtr).item);
    dToC(propval, cast(void*)&(cast(PangoGlyphItem*)this._cPtr).item);
  }

  /**
      Get `glyphs` field.
      Returns: corresponding [pango.glyph_string.GlyphString]
  */
  @property pango.glyph_string.GlyphString glyphs()
  {
    return cToD!(pango.glyph_string.GlyphString)(cast(void*)(cast(PangoGlyphItem*)this._cPtr).glyphs);
  }

  /**
      Set `glyphs` field.
      Params:
        propval = corresponding [pango.glyph_string.GlyphString]
  */
  @property void glyphs(pango.glyph_string.GlyphString propval)
  {
    cValueFree!(pango.glyph_string.GlyphString)(cast(void*)(cast(PangoGlyphItem*)this._cPtr).glyphs);
    dToC(propval, cast(void*)&(cast(PangoGlyphItem*)this._cPtr).glyphs);
  }

  /**
      Get `yOffset` field.
      Returns: shift of the baseline, relative to the baseline
          of the containing line. Positive values shift upwards
  */
  @property int yOffset()
  {
    return (cast(PangoGlyphItem*)this._cPtr).yOffset;
  }

  /**
      Set `yOffset` field.
      Params:
        propval = shift of the baseline, relative to the baseline
            of the containing line. Positive values shift upwards
  */
  @property void yOffset(int propval)
  {
    (cast(PangoGlyphItem*)this._cPtr).yOffset = propval;
  }

  /**
      Get `startXOffset` field.
      Returns: horizontal displacement to apply before the
          glyph item. Positive values shift right
  */
  @property int startXOffset()
  {
    return (cast(PangoGlyphItem*)this._cPtr).startXOffset;
  }

  /**
      Set `startXOffset` field.
      Params:
        propval = horizontal displacement to apply before the
            glyph item. Positive values shift right
  */
  @property void startXOffset(int propval)
  {
    (cast(PangoGlyphItem*)this._cPtr).startXOffset = propval;
  }

  /**
      Get `endXOffset` field.
      Returns: horizontal displacement to apply after th
          glyph item. Positive values shift right
  */
  @property int endXOffset()
  {
    return (cast(PangoGlyphItem*)this._cPtr).endXOffset;
  }

  /**
      Set `endXOffset` field.
      Params:
        propval = horizontal displacement to apply after th
            glyph item. Positive values shift right
  */
  @property void endXOffset(int propval)
  {
    (cast(PangoGlyphItem*)this._cPtr).endXOffset = propval;
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
  pango.glyph_item.GlyphItem[] applyAttrs(string text, pango.attr_list.AttrList list)
  {
    GSList* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = pango_glyph_item_apply_attrs(cast(PangoGlyphItem*)this._cPtr, _text, list ? cast(PangoAttrList*)list._cPtr(No.Dup) : null);
    auto _retval = gSListToD!(pango.glyph_item.GlyphItem, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Make a deep copy of an existing [pango.glyph_item.GlyphItem] structure.
      Returns: the newly allocated [pango.glyph_item.GlyphItem]
  */
  pango.glyph_item.GlyphItem copy()
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
  pango.glyph_item.GlyphItem split(string text, int splitIndex)
  {
    PangoGlyphItem* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = pango_glyph_item_split(cast(PangoGlyphItem*)this._cPtr, _text, splitIndex);
    auto _retval = _cretval ? new pango.glyph_item.GlyphItem(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
