/// Module for [PreferencesRow] class
module adw.preferences_row;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.list_box_row;

/**
    A [gtk.list_box_row.ListBoxRow] used to present preferences.
    
    The [adw.preferences_row.PreferencesRow] widget has a title that `class@PreferencesDialog`
    will use to let the user look for a preference. It doesn't present the title
    in any way and lets you present the preference as you please.
    
    `class@ActionRow` and its derivatives are convenient to use as preference
    rows as they take care of presenting the preference's title while letting you
    compose the inputs of the preference around it.
*/
class PreferencesRow : gtk.list_box_row.ListBoxRow
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
    return cast(void function())adw_preferences_row_get_type != &gidSymbolNotFound ? adw_preferences_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesRow self()
  {
    return this;
  }

  /**
      Get `title` property.
      Returns: The title of the preference represented by this row.
      
      The title is interpreted as Pango markup unless
      `property@PreferencesRow:use-markup` is set to `FALSE`.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the preference represented by this row.
        
        The title is interpreted as Pango markup unless
        `property@PreferencesRow:use-markup` is set to `FALSE`.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `titleSelectable` property.
      Returns: Whether the user can copy the title from the label.
      
      See also [gtk.label.Label.selectable].
  */
  @property bool titleSelectable()
  {
    return getTitleSelectable();
  }

  /**
      Set `titleSelectable` property.
      Params:
        propval = Whether the user can copy the title from the label.
        
        See also [gtk.label.Label.selectable].
  */
  @property void titleSelectable(bool propval)
  {
    return setTitleSelectable(propval);
  }

  /**
      Get `useMarkup` property.
      Returns: Whether to use Pango markup for the title label.
      
      Subclasses may also use it for other labels, such as subtitle.
      
      See also `func@Pango.parse_markup`.
  */
  @property bool useMarkup()
  {
    return getUseMarkup();
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = Whether to use Pango markup for the title label.
        
        Subclasses may also use it for other labels, such as subtitle.
        
        See also `func@Pango.parse_markup`.
  */
  @property void useMarkup(bool propval)
  {
    return setUseMarkup(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an embedded underline in the title indicates a mnemonic.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the title indicates a mnemonic.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Creates a new [adw.preferences_row.PreferencesRow].
      Returns: the newly created [adw.preferences_row.PreferencesRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_row_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the title of the preference represented by self.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_row_get_title(cast(AdwPreferencesRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the user can copy the title from the label
      Returns: whether the user can copy the title from the label
  */
  bool getTitleSelectable()
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_row_get_title_selectable(cast(AdwPreferencesRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to use Pango markup for the title label.
      Returns: whether to use markup
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_row_get_use_markup(cast(AdwPreferencesRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether an embedded underline in the title indicates a mnemonic.
      Returns: whether an embedded underline in the title indicates a mnemonic
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_row_get_use_underline(cast(AdwPreferencesRow*)this._cPtr);
    return _retval;
  }

  /**
      Sets the title of the preference represented by self.
      
      The title is interpreted as Pango markup unless
      `propertyPreferencesRow:use-markup` is set to `FALSE`.
  
      Params:
        title = the title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_preferences_row_set_title(cast(AdwPreferencesRow*)this._cPtr, _title);
  }

  /**
      Sets whether the user can copy the title from the label
      
      See also [gtk.label.Label.selectable].
  
      Params:
        titleSelectable = `TRUE` if the user can copy the title from the label
  */
  void setTitleSelectable(bool titleSelectable)
  {
    adw_preferences_row_set_title_selectable(cast(AdwPreferencesRow*)this._cPtr, titleSelectable);
  }

  /**
      Sets whether to use Pango markup for the title label.
      
      Subclasses may also use it for other labels, such as subtitle.
      
      See also `funcPango.parse_markup`.
  
      Params:
        useMarkup = whether to use markup
  */
  void setUseMarkup(bool useMarkup)
  {
    adw_preferences_row_set_use_markup(cast(AdwPreferencesRow*)this._cPtr, useMarkup);
  }

  /**
      Sets whether an embedded underline in the title indicates a mnemonic.
  
      Params:
        useUnderline = `TRUE` if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    adw_preferences_row_set_use_underline(cast(AdwPreferencesRow*)this._cPtr, useUnderline);
  }
}
