/// Module for [ButtonRow] class
module adw.button_row;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.preferences_row;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;

/**
    A [gtk.list_box_row.ListBoxRow] that looks like a button.
    
    <picture>
      <source srcset="button-rows-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-rows.png" alt="button-rows">
    </picture>
    
    The [adw.button_row.ButtonRow] widget has a title and two icons: before and after the
    title.
    
    It is convenient for presenting actions like "Delete" at the end of a boxed
    list.
    
    [adw.button_row.ButtonRow] is always activatable.
    
    ## CSS nodes
    
    [adw.button_row.ButtonRow] has a main CSS node with name `row` and the style class
    `.button`.
    
    It contains the subnode `box` for its main horizontal box, which contains the
    nodes: `image.icon.start` for the start icon, `label.title` for the title,
    and `image.icon.end` for the end icon.
    
    ## Style classes
    
    The [`.suggested-action`](style-classes.html#suggested-action) style class
    makes [adw.button_row.ButtonRow] use accent color for its background. It should be used
    very sparingly to denote important buttons.
    
    <picture>
      <source srcset="button-row-suggested-action-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-row-suggested-action.png" alt="button-row-suggested-action">
    </picture>
    
    The [`.destructive-action`](style-classes.html#destructive-action) style
    makes the row use destructive colors. It can be used to draw attention to the
    potentially damaging consequences of using it. This style acts as a warning
    to the user.
    
    <picture>
      <source srcset="button-row-destructive-action-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-row-destructive-action.png" alt="button-row-destructive-action">
    </picture>
*/
class ButtonRow : adw.preferences_row.PreferencesRow
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_button_row_get_type != &gidSymbolNotFound ? adw_button_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwButtonRow";
  }

  /** Returns `this`, for use in `with` statements. */
  override ButtonRow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.button_row.ButtonRow]
      Returns: New builder object
  */
  static ButtonRowGidBuilder builder() nothrow
  {
    return new ButtonRowGidBuilder;
  }

  /**
      Get `endIconName` property.
      Returns: The icon name to show after the title.
  */
  @property string endIconName() nothrow
  {
    return getEndIconName();
  }

  /**
      Set `endIconName` property.
      Params:
        propval = The icon name to show after the title.
  */
  @property void endIconName(string propval) nothrow
  {
    setEndIconName(propval);
  }

  /**
      Get `startIconName` property.
      Returns: The icon name to show before the title.
  */
  @property string startIconName() nothrow
  {
    return getStartIconName();
  }

  /**
      Set `startIconName` property.
      Params:
        propval = The icon name to show before the title.
  */
  @property void startIconName(string propval) nothrow
  {
    setStartIconName(propval);
  }

  /**
      Creates a new [adw.button_row.ButtonRow].
      Returns: the newly created [adw.button_row.ButtonRow]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_button_row_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the end icon name for self.
      Returns: the end icon name for self
  */
  string getEndIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_button_row_get_end_icon_name(cast(AdwButtonRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the start icon name for self.
      Returns: the start icon name for self
  */
  string getStartIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_button_row_get_start_icon_name(cast(AdwButtonRow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the end icon name for self.
  
      Params:
        iconName = the end icon name
  */
  void setEndIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_button_row_set_end_icon_name(cast(AdwButtonRow*)this._cPtr, _iconName);
  }

  /**
      Sets the start icon name for self.
  
      Params:
        iconName = the start icon name
  */
  void setStartIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_button_row_set_start_icon_name(cast(AdwButtonRow*)this._cPtr, _iconName);
  }

  /**
      Connect to `Activated` signal.
  
      This signal is emitted after the row has been activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.button_row.ButtonRow buttonRow)`
  
          `buttonRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.button_row.ButtonRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "adw.button_row.ButtonRow.activated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activated", closure, after);
  }
}

/// Fluent builder implementation template for [adw.button_row.ButtonRow]
class ButtonRowGidBuilderImpl(T) : adw.preferences_row.PreferencesRowGidBuilderImpl!T
{


  /**
      Set `endIconName` property.
      Params:
        propval = The icon name to show after the title.
      Returns: Builder instance for fluent chaining
  */
  T endIconName(string propval) nothrow
  {
    return setProperty("end-icon-name", propval);
  }

  /**
      Set `startIconName` property.
      Params:
        propval = The icon name to show before the title.
      Returns: Builder instance for fluent chaining
  */
  T startIconName(string propval) nothrow
  {
    return setProperty("start-icon-name", propval);
  }
}

/// Fluent builder for [adw.button_row.ButtonRow]
final class ButtonRowGidBuilder : ButtonRowGidBuilderImpl!ButtonRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ButtonRow build() nothrow
  {
    return new ButtonRow(cast(void*)createGObject(ButtonRow._getGType), Yes.Take);
  }
}
