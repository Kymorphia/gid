/// Module for [Analysis] class
module pango.analysis;

public import gid.basictypes;
import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.language;
import pango.types;

/**
    The [pango.analysis.Analysis] structure stores information about
    the properties of a segment of text.
*/
class Analysis
{
  PangoAnalysis _cInstance;

  /**
      Create a `analysis.Analysis` wrap type.
      Params:
        font = the font for this segment.
        level = the bidirectional level for this segment.
        gravity = the glyph orientation for this segment (A [pango.types.Gravity]).
        flags = boolean flags for this segment (Since: 1.16).
        script = the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
        language = the detected language for this segment.
  */
  this(pango.font.Font font = pango.font.Font.init, ubyte level = ubyte.init, ubyte gravity = ubyte.init, ubyte flags = ubyte.init, ubyte script = ubyte.init, pango.language.Language language = pango.language.Language.init) nothrow
  {
    this.font = font;
    this.level = level;
    this.gravity = gravity;
    this.flags = flags;
    this.script = script;
    this.language = language;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAnalysis*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `font` field.
      Returns: the font for this segment.
  */
  @property pango.font.Font font() nothrow
  {
    return cToD!(pango.font.Font)(cast(void*)(cast(PangoAnalysis*)this._cPtr).font);
  }

  /**
      Set `font` field.
      Params:
        propval = the font for this segment.
  */
  @property void font(pango.font.Font propval) nothrow
  {
    cValueFree!(pango.font.Font)(cast(void*)(cast(PangoAnalysis*)this._cPtr).font);
    dToC(propval, cast(void*)&(cast(PangoAnalysis*)this._cPtr).font);
  }

  /**
      Get `level` field.
      Returns: the bidirectional level for this segment.
  */
  @property ubyte level() nothrow
  {
    return (cast(PangoAnalysis*)this._cPtr).level;
  }

  /**
      Set `level` field.
      Params:
        propval = the bidirectional level for this segment.
  */
  @property void level(ubyte propval) nothrow
  {
    (cast(PangoAnalysis*)this._cPtr).level = propval;
  }

  /**
      Get `gravity` field.
      Returns: the glyph orientation for this segment (A [pango.types.Gravity]).
  */
  @property ubyte gravity() nothrow
  {
    return (cast(PangoAnalysis*)this._cPtr).gravity;
  }

  /**
      Set `gravity` field.
      Params:
        propval = the glyph orientation for this segment (A [pango.types.Gravity]).
  */
  @property void gravity(ubyte propval) nothrow
  {
    (cast(PangoAnalysis*)this._cPtr).gravity = propval;
  }

  /**
      Get `flags` field.
      Returns: boolean flags for this segment (Since: 1.16).
  */
  @property ubyte flags() nothrow
  {
    return (cast(PangoAnalysis*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = boolean flags for this segment (Since: 1.16).
  */
  @property void flags(ubyte propval) nothrow
  {
    (cast(PangoAnalysis*)this._cPtr).flags = propval;
  }

  /**
      Get `script` field.
      Returns: the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
  */
  @property ubyte script() nothrow
  {
    return (cast(PangoAnalysis*)this._cPtr).script;
  }

  /**
      Set `script` field.
      Params:
        propval = the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
  */
  @property void script(ubyte propval) nothrow
  {
    (cast(PangoAnalysis*)this._cPtr).script = propval;
  }

  /**
      Get `language` field.
      Returns: the detected language for this segment.
  */
  @property pango.language.Language language() nothrow
  {
    return cToD!(pango.language.Language)(cast(void*)(cast(PangoAnalysis*)this._cPtr).language);
  }

  /**
      Set `language` field.
      Params:
        propval = the detected language for this segment.
  */
  @property void language(pango.language.Language propval) nothrow
  {
    cValueFree!(pango.language.Language)(cast(void*)(cast(PangoAnalysis*)this._cPtr).language);
    dToC(propval, cast(void*)&(cast(PangoAnalysis*)this._cPtr).language);
  }

  /**
      Get `extraAttrs` field.
      Returns: extra attributes for this segment.
  */
  @property void*[] extraAttrs() nothrow
  {
    return gSListToD!(void*)((cast(PangoAnalysis*)this._cPtr).extraAttrs);
  }
}
