//!gir Pango-1.0
//!info description "D binding for the Pango library - internationalized text layout and rendering"
//!info homepage https://gitlab.gnome.org/GNOME/pango
//!info docs https://www.kymorphia.com/gid/gid~pango1/
//!info capi https://docs.gtk.org/Pango

//# Disable a method which depends on AttrClass
//!set record[Attribute].method[init][ignore] 1

//# LayoutLine isParagraphStart conflicts with property, disable it
//!set record[LayoutLine].method[is_paragraph_start][ignore] 1

//# Ignore free function which takes ownership of a D array, pointless since D would copy the array just to free it
//!set class[Font].function[descriptions_free][ignore] 1

//# Change Layout.setText() text parameter to an array of chars with a length to remove length param and optimize
//!set class[Layout].method[set_text].parameters.parameter[text].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'

//# Set arrays to be zero-terminated=1
//!set class[Font].method[get_languages].return-value.array[][zero-terminated] 1
//!set record[Language].function[get_preferred].return-value.array[][zero-terminated] 1

//# Use array of characters with a length, to remove the length and optimize
//!set function[attr_break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[default_break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[find_base_dir].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[find_paragraph_boundary].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[get_log_attrs].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[parse_markup].parameters.parameter[markup_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_full].parameters.parameter[item_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_full].parameters.parameter[paragraph_text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_item].parameters.parameter[paragraph_text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_with_flags].parameters.parameter[item_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[shape_with_flags].parameters.parameter[paragraph_text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[tailor_break].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[index_to_x].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[index_to_x_full].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[x_to_index].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Layout].method[set_markup].parameters.parameter[markup].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Layout].method[set_markup_with_accel].parameters.parameter[markup].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[ScriptIter].constructor[new].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[log2vis_get_embedding_levels].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[GlyphString].method[get_logical_widths].parameters.parameter[text].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[Analysis].field[extra_attrs][writable] 0
//!set record[AttrColor].field[attr][writable] 0
//!set record[AttrFloat].field[attr][writable] 0
//!set record[AttrFontDesc].field[attr][writable] 0
//!set record[AttrFontFeatures].field[attr][writable] 0
//!set record[AttrInt].field[attr][writable] 0
//!set record[AttrLanguage].field[attr][writable] 0
//!set record[AttrShape].field[attr][writable] 0
//!set record[AttrSize].field[attr][writable] 0
//!set record[AttrString].field[attr][writable] 0
//!set record[GlyphString].field[glyphs][writable] 0
//!set record[Item].field[analysis][writable] 0
//!set record[LayoutLine].field[runs][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[GlyphItem].field[item][writable] 0
//!set record[GlyphItem].field[glyphs][writable] 0
//!set record[GlyphItemIter].field[glyph_item][writable] 0
//!set record[GlyphItemIter].field[text][writable] 0
//!set record[LayoutLine].field[layout][writable] 0

//# Ignore: Deprecated API with a replacement
//!set record[Analysis].field[shape_engine][ignore] 1
//!set record[Analysis].field[lang_engine][ignore] 1
//!set function[scan_int][ignore] 1
//!set function[scan_string][ignore] 1
//!set function[scan_word][ignore] 1
//!set function[skip_space][ignore] 1

//# Ignore: Internal/implementation-only API, not useful from D
//!set record[AttrShape].function[new_with_data][ignore] 1
//!set record[Attribute].field[klass][ignore] 1

//# Ignore: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[AttrShape].field[data][ignore] 1

//# Disable: Array lengths determined by text length or other API, not described by parameters
//!set function[log2vis_get_embedding_levels][disable] 1
//!set record[GlyphItem].method[letter_space][disable] 1
//!set record[GlyphString].field[log_clusters][disable] 1

//# Hand-written below: Output array lengths determined by text or other API, not described by parameters
//!set record[GlyphItem].method[get_logical_widths][ignore] 1
//!set record[GlyphString].method[get_logical_widths][ignore] 1
//!set record[TabArray].method[get_tabs][ignore] 1

//!class GlyphItem

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

//!class GlyphString

  /**
      Given a glyph string and corresponding text, determine the width corresponding to each character.
      When multiple characters compose a single cluster, the width of the entire cluster is divided equally among the
      characters.
      See also [pango.glyph_item.GlyphItem.getLogicalWidths].
      Params:
        text = the text corresponding to the glyphs
        embeddingLevel = the embedding level of the string
      Returns: the logical widths, one for each character in text
  */
  int[] getLogicalWidths(string text, int embeddingLevel) nothrow
  {
    size_t nChars; // Count characters the same way Pango does (g_utf8_next_char() steps, NUL bytes included)

    for (size_t i = 0; i < text.length; nChars++)
    {
      immutable ubyte c = text[i];
      i += c < 0xC0 ? 1 : c < 0xE0 ? 2 : c < 0xF0 ? 3 : c < 0xF8 ? 4 : c < 0xFC ? 5 : c < 0xFE ? 6 : 1;
    }

    if (nChars == 0)
      return null;

    auto widths = new int[nChars];
    pango_glyph_string_get_logical_widths(cast(PangoGlyphString*)this._cPtr, text.ptr, cast(int)text.length, embeddingLevel, widths.ptr);
    return widths;
  }

//!class TabArray

  /**
      Get the alignments and locations of the tab stops, arrays of length [pango.tab_array.TabArray.getSize].
      Params:
        alignments = Output tab stop alignments
        locations = Output tab stop locations
  */
  void getTabs(out pango.types.TabAlign[] alignments, out int[] locations) nothrow
  {
    import glib.c.functions : g_free;

    PangoTabAlign* _alignments;
    int* _locations;
    pango_tab_array_get_tabs(cast(PangoTabArray*)this._cPtr, &_alignments, &_locations);
    auto size = pango_tab_array_get_size(cast(PangoTabArray*)this._cPtr);

    if (size > 0)
    {
      alignments = _alignments[0 .. size].dup;
      locations = _locations[0 .. size].dup;
    }

    g_free(_alignments);
    g_free(_locations);
  }
