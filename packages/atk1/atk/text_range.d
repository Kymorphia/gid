/// Module for [TextRange] class
module atk.text_range;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.boxed;

/**
    A structure used to describe a text range.
*/
class TextRange : gobject.boxed.Boxed
{

  /**
      Create a `text_range.TextRange` boxed type.
      Params:
        bounds = A rectangle giving the bounds of the text range
        startOffset = The start offset of a AtkTextRange
        endOffset = The end offset of a AtkTextRange
        content = The text in the text range
  */
  this(atk.types.TextRectangle bounds = atk.types.TextRectangle.init, int startOffset = int.init, int endOffset = int.init, string content = string.init)
  {
    super(gMalloc(AtkTextRange.sizeof), Yes.Take);
    this.bounds = bounds;
    this.startOffset = startOffset;
    this.endOffset = endOffset;
    this.content = content;
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
    return cast(void function())atk_text_range_get_type != &gidSymbolNotFound ? atk_text_range_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextRange self()
  {
    return this;
  }

  /**
      Get `bounds` field.
      Returns: A rectangle giving the bounds of the text range
  */
  @property atk.types.TextRectangle bounds()
  {
    return cToD!(atk.types.TextRectangle)(cast(void*)&(cast(AtkTextRange*)this._cPtr).bounds);
  }

  /**
      Set `bounds` field.
      Params:
        propval = A rectangle giving the bounds of the text range
  */
  @property void bounds(atk.types.TextRectangle propval)
  {
    (cast(AtkTextRange*)this._cPtr).bounds = cast(AtkTextRectangle)propval;
  }

  /**
      Get `startOffset` field.
      Returns: The start offset of a AtkTextRange
  */
  @property int startOffset()
  {
    return (cast(AtkTextRange*)this._cPtr).startOffset;
  }

  /**
      Set `startOffset` field.
      Params:
        propval = The start offset of a AtkTextRange
  */
  @property void startOffset(int propval)
  {
    (cast(AtkTextRange*)this._cPtr).startOffset = propval;
  }

  /**
      Get `endOffset` field.
      Returns: The end offset of a AtkTextRange
  */
  @property int endOffset()
  {
    return (cast(AtkTextRange*)this._cPtr).endOffset;
  }

  /**
      Set `endOffset` field.
      Params:
        propval = The end offset of a AtkTextRange
  */
  @property void endOffset(int propval)
  {
    (cast(AtkTextRange*)this._cPtr).endOffset = propval;
  }

  /**
      Get `content` field.
      Returns: The text in the text range
  */
  @property string content()
  {
    return cToD!(string)(cast(void*)(cast(AtkTextRange*)this._cPtr).content);
  }

  /**
      Set `content` field.
      Params:
        propval = The text in the text range
  */
  @property void content(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(AtkTextRange*)this._cPtr).content);
    dToC(propval, cast(void*)&(cast(AtkTextRange*)this._cPtr).content);
  }
}
