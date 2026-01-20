/// Module for [PropertyAction] class
module gio.property_action;

import gid.gid;
import gio.action;
import gio.action_mixin;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.object;

/**
    A [gio.property_action.PropertyAction] is a way to get a [gio.action.Action] with a state value
    reflecting and controlling the value of a [gobject.object.ObjectWrap] property.
    
    The state of the action will correspond to the value of the property.
    Changing it will change the property (assuming the requested value
    matches the requirements as specified in the [gobject.param_spec.ParamSpec]).
    
    Only the most common types are presently supported.  Booleans are
    mapped to booleans, strings to strings, signed/unsigned integers to
    int32/uint32 and floats and doubles to doubles.
    
    If the property is an enum then the state will be string-typed and
    conversion will automatically be performed between the enum value and
    ‘nick’ string as per the [gobject.enum_value.EnumValue] table.
    
    Flags types are not currently supported.
    
    Properties of object types, boxed types and pointer types are not
    supported and probably never will be.
    
    Properties of [glib.variant.Variant] types are not currently supported.
    
    If the property is boolean-valued then the action will have a `NULL`
    parameter type, and activating the action (with no parameter) will
    toggle the value of the property.
    
    In all other cases, the parameter type will correspond to the type of
    the property.
    
    The general idea here is to reduce the number of locations where a
    particular piece of state is kept (and therefore has to be synchronised
    between). [gio.property_action.PropertyAction] does not have a separate state that is kept
    in sync with the property value — its state is the property value.
    
    For example, it might be useful to create a [gio.action.Action] corresponding
    to the `visible-child-name` property of a [[gtk.stack.Stack]](https://docs.gtk.org/gtk4/class.Stack.html)
    so that the current page can be switched from a menu.  The active radio
    indication in the menu is then directly determined from the active page of
    the [gtk.stack.Stack].
    
    An anti-example would be binding the `active-id` property on a
    [[gtk.combo_box.ComboBox]](https://docs.gtk.org/gtk4/class.ComboBox.html). This is
    because the state of the combo box itself is probably uninteresting and is
    actually being used to control something else.
    
    Another anti-example would be to bind to the `visible-child-name`
    property of a [[gtk.stack.Stack]](https://docs.gtk.org/gtk4/class.Stack.html) if
    this value is actually stored in [gio.settings.Settings].  In that case, the
    real source of the value is* [gio.settings.Settings].  If you want
    a [gio.action.Action] to control a setting stored in [gio.settings.Settings],
    see [gio.settings.Settings.createAction] instead, and possibly combine its
    use with [gio.settings.Settings.bind].
*/
class PropertyAction : gobject.object.ObjectWrap, gio.action.Action
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
    return cast(void function())g_property_action_get_type != &gidSymbolNotFound ? g_property_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PropertyAction self()
  {
    return this;
  }

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
        
        If the action is disabled then calls to [gio.action.Action.activate] and
        [gio.action.Action.changeState] have no effect.
  */
  @property bool enabled()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("enabled");
  }

  /**
      Get `parameterType` property.
      Returns: The type of the parameter that must be given when activating the
        action.
  */
  @property glib.variant_type.VariantType parameterType()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.variant_type.VariantType)("parameter-type");
  }

  /**
      Get `state` property.
      Returns: The state of the action, or null if the action is stateless.
  */
  @property glib.variant.Variant state()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.variant.Variant)("state");
  }

  /**
      Get `stateType` property.
      Returns: The #GVariantType of the state that the action has, or null if the
        action is stateless.
  */
  @property glib.variant_type.VariantType stateType()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.variant_type.VariantType)("state-type");
  }

  mixin ActionT!();

  /**
      Creates a #GAction corresponding to the value of property
      property_name on object.
      
      The property must be existent and readable and writable (and not
      construct-only).
      
      This function takes a reference on object and doesn't release it
      until the action is destroyed.
  
      Params:
        name = the name of the action to create
        object = the object that has the property
            to wrap
        propertyName = the name of the property
      Returns: a new #GPropertyAction
  */
  this(string name, gobject.object.ObjectWrap object, string propertyName)
  {
    GPropertyAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = g_property_action_new(_name, object ? cast(GObject*)object._cPtr(No.Dup) : null, _propertyName);
    this(_cretval, Yes.Take);
  }
}
