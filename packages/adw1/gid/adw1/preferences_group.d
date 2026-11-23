/// Module for [PreferencesGroup] class
module gid.adw1.preferences_group;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A group of preference rows.
    
    <picture>
      <source srcset="preferences-group-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-group.png" alt="preferences-group">
    </picture>
    
    An [gid.adw1.preferences_group.PreferencesGroup] represents a group or tightly related preferences,
    which in turn are represented by [gid.adw1.preferences_row.PreferencesRow].
    
    To summarize the role of the preferences it gathers, a group can have both a
    title and a description. The title will be used by [gid.adw1.preferences_dialog.PreferencesDialog]
    to let the user look for a preference.
    
    The [gid.adw1.preferences_group.PreferencesGroup.separateRows] property can be used to
    separate the rows within the group, same as when using the
    [`.boxed-list-separate`](style-classes.html#boxed-lists-cards) style class
    instead of `.boxed-list`.
    
    ## AdwPreferencesGroup as GtkBuildable
    
    The [gid.adw1.preferences_group.PreferencesGroup] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding [gid.adw1.preferences_row.PreferencesRow]s to the list by omitting "type". If "type"
    is omitted and the widget isn't a [gid.adw1.preferences_row.PreferencesRow] the child is added to
    a box below the list.
    
    When the "type" attribute of a child is `header-suffix`, the child
    is set as the suffix on the end of the title and description.
    
    ## CSS nodes
    
    [gid.adw1.preferences_group.PreferencesGroup] has a single CSS node with name `preferencesgroup`.
    
    ## Accessibility
    
    [gid.adw1.preferences_group.PreferencesGroup] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class PreferencesGroup : gid.gtk4.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_preferences_group_get_type != &gidSymbolNotFound ? adw_preferences_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwPreferencesGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.preferences_group.PreferencesGroup]
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
  @property gid.gtk4.widget.Widget headerSuffix() nothrow
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
  @property void headerSuffix(gid.gtk4.widget.Widget propval) nothrow
  {
    setHeaderSuffix(propval);
  }

  /**
      Get `separateRows` property.
      Returns: Whether to separate rows.
        
        Equivalent to using the
        [`.boxed-list-separate`](style-classes.html#boxed-lists-cards) style class
        on a [gid.gtk4.list_box.ListBox] instead of `.boxed-list`.
  */
  @property bool separateRows() nothrow
  {
    return getSeparateRows();
  }

  /**
      Set `separateRows` property.
      Params:
        propval = Whether to separate rows.
          
          Equivalent to using the
          [`.boxed-list-separate`](style-classes.html#boxed-lists-cards) style class
          on a [gid.gtk4.list_box.ListBox] instead of `.boxed-list`.
  */
  @property void separateRows(bool propval) nothrow
  {
    setSeparateRows(propval);
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
      Creates a new [gid.adw1.preferences_group.PreferencesGroup].
      Returns: the newly created [gid.adw1.preferences_group.PreferencesGroup]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_preferences_group_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a child to self.
  
      Params:
        child = the widget to add
  */
  void add(gid.gtk4.widget.Widget child) nothrow
  {
    adw_preferences_group_add(cast(AdwPreferencesGroup*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Binds model to self.
      
      See [gid.gtk4.list_box.ListBox.bindModel].
  
      Params:
        model = a list model to bind
        createRowFunc = a function creating a row for each item, or `NULL` in case model is `NULL`
  */
  void bindModel(gid.gio2.list_model.ListModel model = null, gid.gtk4.types.ListBoxCreateWidgetFunc createRowFunc = null) nothrow
  {
    extern(C) GtkWidget* _createRowFuncCallback(GObject* item, void* userData) nothrow
    {
      gidAttachThread();
      gid.gtk4.widget.Widget _dretval;
      auto _dlg = cast(gid.gtk4.types.ListBoxCreateWidgetFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ListBoxCreateWidgetFunc");
      }
      auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _createRowFuncCB = createRowFunc ? &_createRowFuncCallback : null;
    auto _createRowFunc = createRowFunc ? freezeDelegate(cast(void*)&createRowFunc) : null;
    GDestroyNotify _createRowFuncDestroyCB = createRowFunc ? &thawDelegate : null;
    adw_preferences_group_bind_model(cast(AdwPreferencesGroup*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null, _createRowFuncCB, _createRowFunc, _createRowFuncDestroyCB);
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
  gid.gtk4.widget.Widget getHeaderSuffix() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_group_get_header_suffix(cast(AdwPreferencesGroup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the row at index.
      
      Can return `NULL` if index is larger than the number of rows in the group.
  
      Params:
        index = a row index
      Returns: the row at index
  */
  gid.gtk4.widget.Widget getRow(uint index) nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_group_get_row(cast(AdwPreferencesGroup*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self's rows are separated.
      Returns: whether rows are separated
  */
  bool getSeparateRows() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_group_get_separate_rows(cast(AdwPreferencesGroup*)this._cPtr);
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
  void remove(gid.gtk4.widget.Widget child) nothrow
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
  void setHeaderSuffix(gid.gtk4.widget.Widget suffix = null) nothrow
  {
    adw_preferences_group_set_header_suffix(cast(AdwPreferencesGroup*)this._cPtr, suffix ? cast(GtkWidget*)suffix._cPtr(No.Dup) : null);
  }

  /**
      Sets whether self's rows are separated.
      
      Equivalent to using the
      [`.boxed-list-separate`](style-classes.html#boxed-lists-cards) style class
      on a [gid.gtk4.list_box.ListBox] instead of `.boxed-list`.
  
      Params:
        separateRows = whether to separate rows
  */
  void setSeparateRows(bool separateRows) nothrow
  {
    adw_preferences_group_set_separate_rows(cast(AdwPreferencesGroup*)this._cPtr, separateRows);
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

/// Fluent builder implementation template for [gid.adw1.preferences_group.PreferencesGroup]
class PreferencesGroupGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
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
  T headerSuffix(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("header-suffix", propval);
  }

  /**
      Set `separateRows` property.
      Params:
        propval = Whether to separate rows.
          
          Equivalent to using the
          [`.boxed-list-separate`](style-classes.html#boxed-lists-cards) style class
          on a [gid.gtk4.list_box.ListBox] instead of `.boxed-list`.
      Returns: Builder instance for fluent chaining
  */
  T separateRows(bool propval) nothrow
  {
    return setProperty("separate-rows", propval);
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

/// Fluent builder for [gid.adw1.preferences_group.PreferencesGroup]
final class PreferencesGroupGidBuilder : PreferencesGroupGidBuilderImpl!PreferencesGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PreferencesGroup build() nothrow
  {
    return new PreferencesGroup(cast(void*)createGObject(PreferencesGroup._getGType), Yes.Take);
  }
}
