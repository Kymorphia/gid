/// Module for [PreferencesGroup] class
module adw.preferences_group;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A group of preference rows.
    
    <picture>
      <source srcset="preferences-group-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-group.png" alt="preferences-group">
    </picture>
    
    An [adw.preferences_group.PreferencesGroup] represents a group or tightly related preferences,
    which in turn are represented by `class@PreferencesRow`.
    
    To summarize the role of the preferences it gathers, a group can have both a
    title and a description. The title will be used by `class@PreferencesDialog`
    to let the user look for a preference.
    
    ## AdwPreferencesGroup as GtkBuildable
    
    The [adw.preferences_group.PreferencesGroup] implementation of the [gtk.buildable.Buildable] interface
    supports adding `class@PreferencesRow`s to the list by omitting "type". If "type"
    is omitted and the widget isn't a `class@PreferencesRow` the child is added to
    a box below the list.
    
    When the "type" attribute of a child is `header-suffix`, the child
    is set as the suffix on the end of the title and description.
    
    ## CSS nodes
    
    [adw.preferences_group.PreferencesGroup] has a single CSS node with name `preferencesgroup`.
    
    ## Accessibility
    
    [adw.preferences_group.PreferencesGroup] uses the [gtk.types.AccessibleRole.Group] role.
*/
class PreferencesGroup : gtk.widget.Widget
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
    return cast(void function())adw_preferences_group_get_type != &gidSymbolNotFound ? adw_preferences_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesGroup self()
  {
    return this;
  }

  /**
      Get `description` property.
      Returns: The description for this group of preferences.
  */
  @property string description()
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description for this group of preferences.
  */
  @property void description(string propval)
  {
    return setDescription(propval);
  }

  /**
      Get `headerSuffix` property.
      Returns: The header suffix widget.
        
        Displayed above the list, next to the title and description.
        
        Suffixes are commonly used to show a button or a spinner for the whole
        group.
  */
  @property gtk.widget.Widget headerSuffix()
  {
    return getHeaderSuffix();
  }

  /**
      Set `headerSuffix` property.
      Params:
        propval = The header suffix widget.
          
          Displayed above the list, next to the title and description.
          
          Suffixes are commonly used to show a button or a spinner for the whole
          group.
  */
  @property void headerSuffix(gtk.widget.Widget propval)
  {
    return setHeaderSuffix(propval);
  }

  /**
      Get `title` property.
      Returns: The title for this group of preferences.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of preferences.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Creates a new [adw.preferences_group.PreferencesGroup].
      Returns: the newly created [adw.preferences_group.PreferencesGroup]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_group_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a child to self.
  
      Params:
        child = the widget to add
  */
  void add(gtk.widget.Widget child)
  {
    adw_preferences_group_add(cast(AdwPreferencesGroup*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets the description of self.
      Returns: the description of self
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_group_get_description(cast(AdwPreferencesGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the suffix for self's header.
      Returns: the suffix for self's header.
  */
  gtk.widget.Widget getHeaderSuffix()
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_group_get_header_suffix(cast(AdwPreferencesGroup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title of self
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_group_get_title(cast(AdwPreferencesGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Removes a child from self.
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child)
  {
    adw_preferences_group_remove(cast(AdwPreferencesGroup*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the description for self.
  
      Params:
        description = the description
  */
  void setDescription(string description = null)
  {
    const(char)* _description = description.toCString(No.Alloc);
    adw_preferences_group_set_description(cast(AdwPreferencesGroup*)this._cPtr, _description);
  }

  /**
      Sets the suffix for self's header.
      
      Displayed above the list, next to the title and description.
      
      Suffixes are commonly used to show a button or a spinner for the whole group.
  
      Params:
        suffix = the suffix to set
  */
  void setHeaderSuffix(gtk.widget.Widget suffix = null)
  {
    adw_preferences_group_set_header_suffix(cast(AdwPreferencesGroup*)this._cPtr, suffix ? cast(GtkWidget*)suffix._cPtr(No.Dup) : null);
  }

  /**
      Sets the title for self.
  
      Params:
        title = the title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_preferences_group_set_title(cast(AdwPreferencesGroup*)this._cPtr, _title);
  }
}
