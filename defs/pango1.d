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

//# Disable: Deprecated API with a replacement
//!set record[Analysis].field[shape_engine][ignore] 1
//!set record[Analysis].field[lang_engine][ignore] 1
//!set function[scan_int][ignore] 1
//!set function[scan_string][ignore] 1
//!set function[scan_word][ignore] 1
//!set function[skip_space][ignore] 1

//# Disable: Internal/implementation-only API, not useful from D
//!set record[AttrShape].function[new_with_data][ignore] 1
//!set record[Attribute].field[klass][ignore] 1

//# Disable: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[AttrShape].field[data][ignore] 1
