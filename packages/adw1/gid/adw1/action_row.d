/// Module for [ActionRow] class
module gid.adw1.action_row;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.preferences_row;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.list_box_row;
import gid.gtk4.widget;

/**
    A [gid.gtk4.list_box_row.ListBoxRow] used to present actions.
    
    <picture>
      <source srcset="action-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="action-row.png" alt="action-row">
    </picture>
    
    The [gid.adw1.action_row.ActionRow] widget can have a title, a subtitle and an icon. The row
    can receive additional widgets at its end, or prefix widgets at its start.
    
    It is convenient to present a preference and its related actions.
    
    [gid.adw1.action_row.ActionRow] is unactivatable by default, giving it an activatable widget
    will automatically make it activatable, but unsetting it won't change the
    row's activatability.
    
    ## AdwActionRow as GtkBuildable
    
    The [gid.adw1.action_row.ActionRow] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports adding a child at its end by specifying “suffix” or omitting the
    “type” attribute of a <child> element.
    
    It also supports adding a child as a prefix widget by specifying “prefix” as
    the “type” attribute of a <child> element.
    
    ## CSS nodes
    
    [gid.adw1.action_row.ActionRow] has a main CSS node with name `row`.
    
    It contains the subnode `box.header` for its main horizontal box, and
    `box.title` for the vertical box containing the title and subtitle labels.
    
    It contains subnodes `label.title` and `label.subtitle` representing
    respectively the title label and subtitle label.
    
    ## Style classes
    
    [gid.adw1.action_row.ActionRow] can use the [`.property`](style-classes.html#property-rows)
    style class to emphasize the row subtitle instead of the row title, which is
    useful for displaying read-only properties.
    
    <picture>
      <source srcset="property-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="property-row.png" alt="property-row">
    </picture>
    
    When used together with the `.monospace` style class, only the subtitle
    becomes monospace, not the title or any extra widgets.
*/
class ActionRow : gid.adw1.preferences_row.PreferencesRow
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
    return cast(void function())adw_action_row_get_type != &gidSymbolNotFound ? adw_action_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwActionRow";
  }

  /** Returns `this`, for use in `with` statements. */
  override ActionRow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.action_row.ActionRow]
      Returns: New builder object
  */
  static ActionRowGidBuilder builder() nothrow
  {
    return new ActionRowGidBuilder;
  }

  /**
      Get `activatableWidget` property.
      Returns: The widget to activate when the row is activated.
        
        The row can be activated either by clicking on it, calling
        [gid.adw1.action_row.ActionRow.activate], or via mnemonics in the title.
        See the [gid.adw1.preferences_row.PreferencesRow.useUnderline] property to enable
        mnemonics.
        
        The target widget will be activated by emitting the
        [gid.gtk4.widget.Widget.mnemonicActivate] signal on it.
  */
  @property gid.gtk4.widget.Widget activatableWidget() nothrow
  {
    return getActivatableWidget();
  }

  /**
      Set `activatableWidget` property.
      Params:
        propval = The widget to activate when the row is activated.
          
          The row can be activated either by clicking on it, calling
          [gid.adw1.action_row.ActionRow.activate], or via mnemonics in the title.
          See the [gid.adw1.preferences_row.PreferencesRow.useUnderline] property to enable
          mnemonics.
          
          The target widget will be activated by emitting the
          [gid.gtk4.widget.Widget.mnemonicActivate] signal on it.
  */
  @property void activatableWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setActivatableWidget(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for this row.
  
      Deprecated: Use [gid.adw1.action_row.ActionRow.addPrefix] to add an icon.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this row.
  
      Deprecated: Use [gid.adw1.action_row.ActionRow.addPrefix] to add an icon.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle for this row.
        
        The subtitle is interpreted as Pango markup unless
        [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `FALSE`.
  */
  @property string subtitle() nothrow
  {
    return getSubtitle();
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for this row.
          
          The subtitle is interpreted as Pango markup unless
          [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `FALSE`.
  */
  @property void subtitle(string propval) nothrow
  {
    setSubtitle(propval);
  }

  /**
      Get `subtitleLines` property.
      Returns: The number of lines at the end of which the subtitle label will be
        ellipsized.
        
        If the value is 0, the number of lines won't be limited.
  */
  @property int subtitleLines() nothrow
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
  @property void subtitleLines(int propval) nothrow
  {
    setSubtitleLines(propval);
  }

  /**
      Get `subtitleSelectable` property.
      Returns: Whether the user can copy the subtitle from the label.
        
        See also [gid.gtk4.label.Label.selectable].
  */
  @property bool subtitleSelectable() nothrow
  {
    return getSubtitleSelectable();
  }

  /**
      Set `subtitleSelectable` property.
      Params:
        propval = Whether the user can copy the subtitle from the label.
          
          See also [gid.gtk4.label.Label.selectable].
  */
  @property void subtitleSelectable(bool propval) nothrow
  {
    setSubtitleSelectable(propval);
  }

  /**
      Get `titleLines` property.
      Returns: The number of lines at the end of which the title label will be ellipsized.
        
        If the value is 0, the number of lines won't be limited.
  */
  @property int titleLines() nothrow
  {
    return getTitleLines();
  }

  /**
      Set `titleLines` property.
      Params:
        propval = The number of lines at the end of which the title label will be ellipsized.
          
          If the value is 0, the number of lines won't be limited.
  */
  @property void titleLines(int propval) nothrow
  {
    setTitleLines(propval);
  }

  /**
      Creates a new [gid.adw1.action_row.ActionRow].
      Returns: the newly created [gid.adw1.action_row.ActionRow]
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
      _cretval = adw_action_row_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Activates self.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  override protected void vfuncActivate()
  {
    auto _klass = cast(AdwActionRowClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(AdwActionRow*)this._cPtr);
  }

  alias activate = gid.gtk4.widget.Widget.activate;

  /**
      Activates self.
  */
  void activate() nothrow
  {
    adw_action_row_activate(cast(AdwActionRow*)this._cPtr);
  }

  /**
      Adds a prefix widget to self.
  
      Params:
        widget = a widget
  */
  void addPrefix(gid.gtk4.widget.Widget widget) nothrow
  {
    adw_action_row_add_prefix(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Adds a suffix widget to self.
  
      Params:
        widget = a widget
  */
  void addSuffix(gid.gtk4.widget.Widget widget) nothrow
  {
    adw_action_row_add_suffix(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the widget activated when self is activated.
      Returns: the activatable widget for self
  */
  gid.gtk4.widget.Widget getActivatableWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_action_row_get_activatable_widget(cast(AdwActionRow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for self.
      Returns: the icon name for self
  
      Deprecated: Use [gid.adw1.action_row.ActionRow.addPrefix] to add an icon.
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_action_row_get_icon_name(cast(AdwActionRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the subtitle for self.
      Returns: the subtitle for self
  */
  string getSubtitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_action_row_get_subtitle(cast(AdwActionRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of lines at the end of which the subtitle label will be
      ellipsized.
      Returns: the number of lines at the end of which the subtitle label will be
          ellipsized
  */
  int getSubtitleLines() nothrow
  {
    int _retval;
    _retval = adw_action_row_get_subtitle_lines(cast(AdwActionRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the user can copy the subtitle from the label
      Returns: whether the user can copy the subtitle from the label
  */
  bool getSubtitleSelectable() nothrow
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
  int getTitleLines() nothrow
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
  void remove(gid.gtk4.widget.Widget widget) nothrow
  {
    adw_action_row_remove(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the widget to activate when self is activated.
      
      The row can be activated either by clicking on it, calling
      [gid.adw1.action_row.ActionRow.activate], or via mnemonics in the title.
      See the [gid.adw1.preferences_row.PreferencesRow.useUnderline] property to enable mnemonics.
      
      The target widget will be activated by emitting the
      [gid.gtk4.widget.Widget.mnemonicActivate] signal on it.
  
      Params:
        widget = the target widget
  */
  void setActivatableWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    adw_action_row_set_activatable_widget(cast(AdwActionRow*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name for self.
  
      Params:
        iconName = the icon name
  
      Deprecated: Use [gid.adw1.action_row.ActionRow.addPrefix] to add an icon.
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_action_row_set_icon_name(cast(AdwActionRow*)this._cPtr, _iconName);
  }

  /**
      Sets the subtitle for self.
      
      The subtitle is interpreted as Pango markup unless
      [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `FALSE`.
  
      Params:
        subtitle = the subtitle
  */
  void setSubtitle(string subtitle) nothrow
  {
    const(char)* _subtitle = subtitle.toCString!(No.Malloc, No.Nullable);
    adw_action_row_set_subtitle(cast(AdwActionRow*)this._cPtr, _subtitle);
  }

  /**
      Sets the number of lines at the end of which the subtitle label will be
      ellipsized.
      
      If the value is 0, the number of lines won't be limited.
  
      Params:
        subtitleLines = the number of lines at the end of which the subtitle label will be ellipsized
  */
  void setSubtitleLines(int subtitleLines) nothrow
  {
    adw_action_row_set_subtitle_lines(cast(AdwActionRow*)this._cPtr, subtitleLines);
  }

  /**
      Sets whether the user can copy the subtitle from the label
      
      See also [gid.gtk4.label.Label.selectable].
  
      Params:
        subtitleSelectable = `TRUE` if the user can copy the subtitle from the label
  */
  void setSubtitleSelectable(bool subtitleSelectable) nothrow
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
  void setTitleLines(int titleLines) nothrow
  {
    adw_action_row_set_title_lines(cast(AdwActionRow*)this._cPtr, titleLines);
  }

  /**
      Connect to `Activated` signal.
  
      This signal is emitted after the row has been activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.action_row.ActionRow actionRow)`
  
          `actionRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.action_row.ActionRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.action_row.ActionRow.activated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activated", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ActionRow
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.adw1.action_row.ActionRow), T.stringof ~ " is not derived from gid.adw1.action_row.ActionRow");

    gid.gtk4.list_box_row.ListBoxRow._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.adw1.action_row.ActionRow))
      _installVfunc(klass, "activate");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AdwActionRowClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(AdwActionRow* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.adw1.action_row.ActionRow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(AdwActionRowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(self);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.adw1.action_row.ActionRow.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.adw1.action_row.ActionRow]
class ActionRowGidBuilderImpl(T) : gid.adw1.preferences_row.PreferencesRowGidBuilderImpl!T
{


  /**
      Set `activatableWidget` property.
      Params:
        propval = The widget to activate when the row is activated.
          
          The row can be activated either by clicking on it, calling
          [gid.adw1.action_row.ActionRow.activate], or via mnemonics in the title.
          See the [gid.adw1.preferences_row.PreferencesRow.useUnderline] property to enable
          mnemonics.
          
          The target widget will be activated by emitting the
          [gid.gtk4.widget.Widget.mnemonicActivate] signal on it.
      Returns: Builder instance for fluent chaining
  */
  T activatableWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("activatable-widget", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this row.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.adw1.action_row.ActionRow.addPrefix] to add an icon.
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for this row.
          
          The subtitle is interpreted as Pango markup unless
          [gid.adw1.preferences_row.PreferencesRow.useMarkup] is set to `FALSE`.
      Returns: Builder instance for fluent chaining
  */
  T subtitle(string propval) nothrow
  {
    return setProperty("subtitle", propval);
  }

  /**
      Set `subtitleLines` property.
      Params:
        propval = The number of lines at the end of which the subtitle label will be
          ellipsized.
          
          If the value is 0, the number of lines won't be limited.
      Returns: Builder instance for fluent chaining
  */
  T subtitleLines(int propval) nothrow
  {
    return setProperty("subtitle-lines", propval);
  }

  /**
      Set `subtitleSelectable` property.
      Params:
        propval = Whether the user can copy the subtitle from the label.
          
          See also [gid.gtk4.label.Label.selectable].
      Returns: Builder instance for fluent chaining
  */
  T subtitleSelectable(bool propval) nothrow
  {
    return setProperty("subtitle-selectable", propval);
  }

  /**
      Set `titleLines` property.
      Params:
        propval = The number of lines at the end of which the title label will be ellipsized.
          
          If the value is 0, the number of lines won't be limited.
      Returns: Builder instance for fluent chaining
  */
  T titleLines(int propval) nothrow
  {
    return setProperty("title-lines", propval);
  }
}

/// Fluent builder for [gid.adw1.action_row.ActionRow]
final class ActionRowGidBuilder : ActionRowGidBuilderImpl!ActionRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ActionRow build() nothrow
  {
    return new ActionRow(cast(void*)createGObject(ActionRow._getGType), Yes.Take);
  }
}
