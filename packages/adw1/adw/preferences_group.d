/// Module for [PreferencesGroup] class
module adw.preferences_group;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
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
    which in turn are represented by [adw.preferences_row.PreferencesRow].
    
    To summarize the role of the preferences it gathers, a group can have both a
    title and a description. The title will be used by [adw.preferences_dialog.PreferencesDialog]
    to let the user look for a preference.
    
    ## AdwPreferencesGroup as GtkBuildable
    
    The [adw.preferences_group.PreferencesGroup] implementation of the [gtk.buildable.Buildable] interface
    supports adding [adw.preferences_row.PreferencesRow]s to the list by omitting "type". If "type"
    is omitted and the widget isn't a [adw.preferences_row.PreferencesRow] the child is added to
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_preferences_group_get_type != &gidSymbolNotFound ? adw_preferences_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.preferences_group.PreferencesGroup]
      Returns: New builder object
  */
  static PreferencesGroupGidBuilder builder() nothrow
  {
    return new PreferencesGroupGidBuilder;
  }

  /**
      Get `description` property.
      Returns: The description for this group of preferences.
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description for this group of preferences.
  */
  @property void description(string propval) nothrow
  {
    setDescription(propval);
  }

  /**
      Get `headerSuffix` property.
      Returns: The header suffix widget.
        
        Displayed above the list, next to the title and description.
        
        Suffixes are commonly used to show a button or a spinner for the whole
        group.
  */
  @property gtk.widget.Widget headerSuffix() nothrow
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
  @property void headerSuffix(gtk.widget.Widget propval) nothrow
  {
    setHeaderSuffix(propval);
  }

  /**
      Get `title` property.
      Returns: The title for this group of preferences.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of preferences.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [adw.preferences_group.PreferencesGroup].
      Returns: the newly created [adw.preferences_group.PreferencesGroup]
  */
  this() nothrow
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
  void add(gtk.widget.Widget child) nothrow
  {
    adw_preferences_group_add(cast(AdwPreferencesGroup*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets the description of self.
      Returns: the description of self
  */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_group_get_description(cast(AdwPreferencesGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the suffix for self's header.
      Returns: the suffix for self's header.
  */
  gtk.widget.Widget getHeaderSuffix() nothrow
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
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_group_get_title(cast(AdwPreferencesGroup*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Removes a child from self.
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child) nothrow
  {
    adw_preferences_group_remove(cast(AdwPreferencesGroup*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the description for self.
  
      Params:
        description = the description
  */
  void setDescription(string description = null) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, Yes.Nullable);
    adw_preferences_group_set_description(cast(AdwPreferencesGroup*)this._cPtr, _description);
  }

  /**
      Sets the suffix for self's header.
      
      Displayed above the list, next to the title and description.
      
      Suffixes are commonly used to show a button or a spinner for the whole group.
  
      Params:
        suffix = the suffix to set
  */
  void setHeaderSuffix(gtk.widget.Widget suffix = null) nothrow
  {
    adw_preferences_group_set_header_suffix(cast(AdwPreferencesGroup*)this._cPtr, suffix ? cast(GtkWidget*)suffix._cPtr(No.Dup) : null);
  }

  /**
      Sets the title for self.
  
      Params:
        title = the title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    adw_preferences_group_set_title(cast(AdwPreferencesGroup*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [adw.preferences_group.PreferencesGroup]
class PreferencesGroupGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `description` property.
      Params:
        propval = The description for this group of preferences.
      Returns: Builder instance for fluent chaining
  */
  T description(string propval) nothrow
  {
    return setProperty("description", propval);
  }

  /**
      Set `headerSuffix` property.
      Params:
        propval = The header suffix widget.
          
          Displayed above the list, next to the title and description.
          
          Suffixes are commonly used to show a button or a spinner for the whole
          group.
      Returns: Builder instance for fluent chaining
  */
  T headerSuffix(gtk.widget.Widget propval) nothrow
  {
    return setProperty("header-suffix", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of preferences.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [adw.preferences_group.PreferencesGroup]
final class PreferencesGroupGidBuilder : PreferencesGroupGidBuilderImpl!PreferencesGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PreferencesGroup build() nothrow
  {
    return new PreferencesGroup(cast(void*)createGObject(PreferencesGroup._getGType), No.Take);
  }
}
