/// Module for [ActionRow] class
module adw.action_row;

import adw.c.functions;
import adw.c.types;
import adw.preferences_row;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A [gtk.list_box_row.ListBoxRow] used to present actions.
    
    <picture>
      <source srcset="action-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="action-row.png" alt="action-row">
    </picture>
    
    The [adw.action_row.ActionRow] widget can have a title, a subtitle and an icon. The row
    can receive additional widgets at its end, or prefix widgets at its start.
    
    It is convenient to present a preference and its related actions.
    
    [adw.action_row.ActionRow] is unactivatable by default, giving it an activatable widget
    will automatically make it activatable, but unsetting it won't change the
    row's activatability.
    
    ## AdwActionRow as GtkBuildable
    
    The [adw.action_row.ActionRow] implementation of the [gtk.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [adw.action_row.ActionRow] has a main CSS node with name `row`.
    
    It contains the subnode `box.header` for its main horizontal box, and
    `box.title` for the vertical box containing the title and subtitle labels.
    
    It contains subnodes `label.title` and `label.subtitle` representing
    respectively the title label and subtitle label.
    
    [adw.action_row.ActionRow] can use the
    [`.property`](style-classes.html#property-rows) style class to emphasize
    the row subtitle instead of the row title, which is useful for
    displaying read-only properties.
*/
class ActionRow : adw.preferences_row.PreferencesRow
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
    return cast(void function())adw_action_row_get_type != &gidSymbolNotFound ? adw_action_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ActionRow self()
  {
    return this;
  }

  /**
      Get `activatableWidget` property.
      Returns: The widget to activate when the row is activated.
      
      The row can be activated either by clicking on it, calling
      [adw.action_row.ActionRow.activate], or via mnemonics in the title.
      See the `property@PreferencesRow:use-underline` property to enable
      mnemonics.
      
      The target widget will be activated by emitting the
      `signal@Gtk.Widget::mnemonic-activate` signal on it.
  */
  @property gtk.widget.Widget activatableWidget()
  {
    return getActivatableWidget();
  }

  /**
      Set `activatableWidget` property.
      Params:
        propval = The widget to activate when the row is activated.
        
        The row can be activated either by clicking on it, calling
        [adw.action_row.ActionRow.activate], or via mnemonics in the title.
        See the `property@PreferencesRow:use-underline` property to enable
        mnemonics.
        
        The target widget will be activated by emitting the
        `signal@Gtk.Widget::mnemonic-activate` signal on it.
  */
  @property void activatableWidget(gtk.widget.Widget propval)
  {
    return setActivatableWidget(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for this row.
  
      Deprecated: Use [adw.action_row.ActionRow.addPrefix] to add an icon.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this row.
  
      Deprecated: Use [adw.action_row.ActionRow.addPrefix] to add an icon.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle for this row.
      
      The subtitle is interpreted as Pango markup unless
      `property@PreferencesRow:use-markup` is set to `FALSE`.
  */
  @property string subtitle()
  {
    return getSubtitle();
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for this row.
        
        The subtitle is interpreted as Pango markup unless
        `property@PreferencesRow:use-markup` is set to `FALSE`.
  */
  @property void subtitle(string propval)
  {
    return setSubtitle(propval);
  }

  /**
      Get `subtitleLines` property.
      Returns: The number of lines at the end of which the subtitle label will be
      ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  */
  @property int subtitleLines()
  {
    return getSubtitleLines();
  }

  /**
      Set `subtitleLines` property.
      Params:
        propval = The number of lines at the end of which the subtitle label will be
        ellipsized.
        
        If the value is 0, the number of lines won't be limited.
  */
  @property void subtitleLines(int propval)
  {
    return setSubtitleLines(propval);
  }

  /**
      Get `subtitleSelectable` property.
      Returns: Whether the user can copy the subtitle from the label.
      
      See also [gtk.label.Label.selectable].
  */
  @property bool subtitleSelectable()
  {
    return getSubtitleSelectable();
  }

  /**
      Set `subtitleSelectable` property.
      Params:
        propval = Whether the user can copy the subtitle from the label.
        
        See also [gtk.label.Label.selectable].
  */
  @property void subtitleSelectable(bool propval)
  {
    return setSubtitleSelectable(propval);
  }

  /**
      Get `titleLines` property.
      Returns: The number of lines at the end of which the title label will be ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  */
  @property int titleLines()
  {
    return getTitleLines();
  }

  /**
      Set `titleLines` property.
      Params:
        propval = The number of lines at the end of which the title label will be ellipsized.
        
        If the value is 0, the number of lines won't be limited.
  */
  @property void titleLines(int propval)
  {
    return setTitleLines(propval);
  }

  /**
      Creates a new [adw.action_row.ActionRow].
      Returns: the newly created [adw.action_row.ActionRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_action_row_new();
    this(_cretval, No.Take);
  }

  alias activate = gtk.widget.Widget.activate;

  /**
      Activates self.
  */
  void activate()
  {
    adw_action_row_activate(cast(AdwActionRow*)this._cPtr);
  }

  /**
      Adds a prefix widget to self.
  
      Params:
        widget = a widget
  */
  void addPrefix(gtk.widget.Widget widget)
  {
    adw_action_row_add_prefix(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Adds a suffix widget to self.
  
      Params:
        widget = a widget
  */
  void addSuffix(gtk.widget.Widget widget)
  {
    adw_action_row_add_suffix(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the widget activated when self is activated.
      Returns: the activatable widget for self
  */
  gtk.widget.Widget getActivatableWidget()
  {
    GtkWidget* _cretval;
    _cretval = adw_action_row_get_activatable_widget(cast(AdwActionRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for self.
      Returns: the icon name for self
  
      Deprecated: Use [adw.action_row.ActionRow.addPrefix] to add an icon.
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_action_row_get_icon_name(cast(AdwActionRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the subtitle for self.
      Returns: the subtitle for self
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = adw_action_row_get_subtitle(cast(AdwActionRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of lines at the end of which the subtitle label will be
      ellipsized.
      Returns: the number of lines at the end of which the subtitle label will be
          ellipsized
  */
  int getSubtitleLines()
  {
    int _retval;
    _retval = adw_action_row_get_subtitle_lines(cast(AdwActionRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the user can copy the subtitle from the label
      Returns: whether the user can copy the subtitle from the label
  */
  bool getSubtitleSelectable()
  {
    bool _retval;
    _retval = cast(bool)adw_action_row_get_subtitle_selectable(cast(AdwActionRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of lines at the end of which the title label will be
      ellipsized.
      Returns: the number of lines at the end of which the title label will be
          ellipsized
  */
  int getTitleLines()
  {
    int _retval;
    _retval = adw_action_row_get_title_lines(cast(AdwActionRow*)this._cPtr);
    return _retval;
  }

  /**
      Removes a child from self.
  
      Params:
        widget = the child to be removed
  */
  void remove(gtk.widget.Widget widget)
  {
    adw_action_row_remove(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the widget to activate when self is activated.
      
      The row can be activated either by clicking on it, calling
      [adw.action_row.ActionRow.activate], or via mnemonics in the title.
      See the `propertyPreferencesRow:use-underline` property to enable mnemonics.
      
      The target widget will be activated by emitting the
      `signalGtk.Widget::mnemonic-activate` signal on it.
  
      Params:
        widget = the target widget
  */
  void setActivatableWidget(gtk.widget.Widget widget = null)
  {
    adw_action_row_set_activatable_widget(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for self.
  
      Params:
        iconName = the icon name
  
      Deprecated: Use [adw.action_row.ActionRow.addPrefix] to add an icon.
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_action_row_set_icon_name(cast(AdwActionRow*)this._cPtr, _iconName);
  }

  /**
      Sets the subtitle for self.
      
      The subtitle is interpreted as Pango markup unless
      `propertyPreferencesRow:use-markup` is set to `FALSE`.
  
      Params:
        subtitle = the subtitle
  */
  void setSubtitle(string subtitle)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    adw_action_row_set_subtitle(cast(AdwActionRow*)this._cPtr, _subtitle);
  }

  /**
      Sets the number of lines at the end of which the subtitle label will be
      ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  
      Params:
        subtitleLines = the number of lines at the end of which the subtitle label will be ellipsized
  */
  void setSubtitleLines(int subtitleLines)
  {
    adw_action_row_set_subtitle_lines(cast(AdwActionRow*)this._cPtr, subtitleLines);
  }

  /**
      Sets whether the user can copy the subtitle from the label
      
      See also [gtk.label.Label.selectable].
  
      Params:
        subtitleSelectable = `TRUE` if the user can copy the subtitle from the label
  */
  void setSubtitleSelectable(bool subtitleSelectable)
  {
    adw_action_row_set_subtitle_selectable(cast(AdwActionRow*)this._cPtr, subtitleSelectable);
  }

  /**
      Sets the number of lines at the end of which the title label will be
      ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  
      Params:
        titleLines = the number of lines at the end of which the title label will be ellipsized
  */
  void setTitleLines(int titleLines)
  {
    adw_action_row_set_title_lines(cast(AdwActionRow*)this._cPtr, titleLines);
  }

  /**
      Connect to `Activated` signal.
  
      This signal is emitted after the row has been activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.action_row.ActionRow actionRow))
  
          `actionRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.action_row.ActionRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activated", closure, after);
  }
}
