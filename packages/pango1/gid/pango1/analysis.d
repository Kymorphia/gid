/// Module for [Analysis] class
module gid.pango1.analysis;

public import gid.core.basictypes;
import gid.core.utils;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font;
import gid.pango1.language;
import gid.pango1.types;

/**
    The [gid.pango1.analysis.Analysis] structure stores information about
    the properties of a segment of text.
*/
@gidGir("Analysis")
class Analysis : StructWrap!(PangoAnalysis)
{
  /**
      Create a `analysis.Analysis` wrap type.
      Params:
        font = the font for this segment.
        level = the bidirectional level for this segment.
        gravity = the glyph orientation for this segment (A [gid.pango1.types.Gravity]).
        flags = boolean flags for this segment (Since: 1.16).
        script = the detected script for this segment (A [gid.pango1.types.Script]) (Since: 1.18).
        language = the detected language for this segment.
  */
  this(gid.pango1.font.Font font = gid.pango1.font.Font.init, ubyte level = ubyte.init, ubyte gravity = ubyte.init, ubyte flags = ubyte.init, ubyte script = ubyte.init, gid.pango1.language.Language language = gid.pango1.language.Language.init) nothrow
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
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private gid.pango1.font.Font _fontRef; // Keeps borrowed field value alive

  /**
      Get `font` field.
      Returns: the font for this segment.
  */
  @property gid.pango1.font.Font font() nothrow
  {
    return cToD!(gid.pango1.font.Font)(cast(void*)(cast(PangoAnalysis*)this._cPtr).font);
  }

  /**
      Set `font` field.
      Params:
        propval = the font for this segment.
  */
  @property void font(gid.pango1.font.Font propval) nothrow
  {
    if (_refuseBorrowedStore("font"))
      return;

    _fontRef = propval;
    (cast(PangoAnalysis*)this._cPtr).font = propval ? cast(PangoFont*)propval._cPtr(No.Dup) : null;
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
      Returns: the glyph orientation for this segment (A [gid.pango1.types.Gravity]).
  */
  @property ubyte gravity() nothrow
  {
    return (cast(PangoAnalysis*)this._cPtr).gravity;
  }

  /**
      Set `gravity` field.
      Params:
        propval = the glyph orientation for this segment (A [gid.pango1.types.Gravity]).
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
      Returns: the detected script for this segment (A [gid.pango1.types.Script]) (Since: 1.18).
  */
  @property ubyte script() nothrow
  {
    return (cast(PangoAnalysis*)this._cPtr).script;
  }

  /**
      Set `script` field.
      Params:
        propval = the detected script for this segment (A [gid.pango1.types.Script]) (Since: 1.18).
  */
  @property void script(ubyte propval) nothrow
  {
    (cast(PangoAnalysis*)this._cPtr).script = propval;
  }

  private gid.pango1.language.Language _languageRef; // Keeps borrowed field value alive

  /**
      Get `language` field.
      Returns: the detected language for this segment.
  */
  @property gid.pango1.language.Language language() nothrow
  {
    return cToD!(gid.pango1.language.Language)(cast(void*)(cast(PangoAnalysis*)this._cPtr).language);
  }

  /**
      Set `language` field.
      Params:
        propval = the detected language for this segment.
  */
  @property void language(gid.pango1.language.Language propval) nothrow
  {
    if (_refuseBorrowedStore("language"))
      return;

    _languageRef = propval;
    (cast(PangoAnalysis*)this._cPtr).language = propval ? cast(PangoLanguage*)propval._cPtr(No.Dup) : null;
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
