/// Module for [GlyphInfo] class
module harfbuzz.glyph_info;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The #hb_glyph_info_t is the structure that holds information about the
    glyphs and their relation to input text.
*/
class GlyphInfo : gobject.boxed.Boxed
{

  /**
      Create a `glyph_info.GlyphInfo` boxed type.
      Params:
        codepoint = either a Unicode code point (before shaping) or a glyph index
                      (after shaping).
        cluster = the index of the character in the original text that corresponds
                    to this #hb_glyph_info_t, or whatever the client passes to
                    [harfbuzz.global.bufferAdd]. More than one #hb_glyph_info_t can have the same
                    @cluster value, if they resulted from the same character (e.g. one
                    to many glyph substitution), and when more than one character gets
                    merged in the same glyph (e.g. many to one glyph substitution) the
                    #hb_glyph_info_t will have the smallest cluster value of them.
                    By default some characters are merged into the same cluster
                    (e.g. combining marks have the same cluster as their bases)
                    even if they are separate glyphs, [harfbuzz.global.bufferSetClusterLevel]
                    allow selecting more fine-grained cluster handling.
  */
  this(harfbuzz.types.Codepoint codepoint = harfbuzz.types.Codepoint.init, uint cluster = uint.init)
  {
    super(gMalloc(hb_glyph_info_t.sizeof), Yes.Take);
    this.codepoint = codepoint;
    this.cluster = cluster;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_glyph_info_get_type != &gidSymbolNotFound ? hb_gobject_glyph_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphInfo self()
  {
    return this;
  }

  /**
      Get `codepoint` field.
      Returns: either a Unicode code point (before shaping) or a glyph index
                    (after shaping).
  */
  @property harfbuzz.types.Codepoint codepoint()
  {
    return (cast(hb_glyph_info_t*)this._cPtr).codepoint;
  }

  /**
      Set `codepoint` field.
      Params:
        propval = either a Unicode code point (before shaping) or a glyph index
                      (after shaping).
  */
  @property void codepoint(harfbuzz.types.Codepoint propval)
  {
    (cast(hb_glyph_info_t*)this._cPtr).codepoint = propval;
  }

  /**
      Get `cluster` field.
      Returns: the index of the character in the original text that corresponds
                  to this #hb_glyph_info_t, or whatever the client passes to
                  [harfbuzz.global.bufferAdd]. More than one #hb_glyph_info_t can have the same
                  @cluster value, if they resulted from the same character (e.g. one
                  to many glyph substitution), and when more than one character gets
                  merged in the same glyph (e.g. many to one glyph substitution) the
                  #hb_glyph_info_t will have the smallest cluster value of them.
                  By default some characters are merged into the same cluster
                  (e.g. combining marks have the same cluster as their bases)
                  even if they are separate glyphs, [harfbuzz.global.bufferSetClusterLevel]
                  allow selecting more fine-grained cluster handling.
  */
  @property uint cluster()
  {
    return (cast(hb_glyph_info_t*)this._cPtr).cluster;
  }

  /**
      Set `cluster` field.
      Params:
        propval = the index of the character in the original text that corresponds
                    to this #hb_glyph_info_t, or whatever the client passes to
                    [harfbuzz.global.bufferAdd]. More than one #hb_glyph_info_t can have the same
                    @cluster value, if they resulted from the same character (e.g. one
                    to many glyph substitution), and when more than one character gets
                    merged in the same glyph (e.g. many to one glyph substitution) the
                    #hb_glyph_info_t will have the smallest cluster value of them.
                    By default some characters are merged into the same cluster
                    (e.g. combining marks have the same cluster as their bases)
                    even if they are separate glyphs, [harfbuzz.global.bufferSetClusterLevel]
                    allow selecting more fine-grained cluster handling.
  */
  @property void cluster(uint propval)
  {
    (cast(hb_glyph_info_t*)this._cPtr).cluster = propval;
  }
}
