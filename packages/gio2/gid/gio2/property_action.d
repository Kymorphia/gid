/// Module for [PropertyAction] class
module gid.gio2.property_action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action;
import gid.gio2.action_mixin;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.property_action.PropertyAction] is a way to get a [gid.gio2.action.Action] with a state value
    reflecting and controlling the value of a [gid.gobject2.object.ObjectWrap] property.
    
    The state of the action will correspond to the value of the property.
    Changing it will change the property (assuming the requested value
    matches the requirements as specified in the [gid.gobject2.param_spec.ParamSpec]).
    
    Only the most common types are presently supported.  Booleans are
    mapped to booleans, strings to strings, signed/unsigned integers to
    int32/uint32 and floats and doubles to doubles.
    
    If the property is an enum then the state will be string-typed and
    conversion will automatically be performed between the enum value and
    ‘nick’ string as per the [gid.gobject2.enum_value.EnumValue] table.
    
    Flags types are not currently supported.
    
    Properties of object types, boxed types and pointer types are not
    supported and probably never will be.
    
    Properties of [gid.glib2.variant.Variant] types are not currently supported.
    
    If the property is boolean-valued then the action will have a `NULL`
    parameter type, and activating the action (with no parameter) will
    toggle the value of the property.
    
    In all other cases, the parameter type will correspond to the type of
    the property.
    
    The general idea here is to reduce the number of locations where a
    particular piece of state is kept (and therefore has to be synchronised
    between). [gid.gio2.property_action.PropertyAction] does not have a separate state that is kept
    in sync with the property value — its state is the property value.
    
    For example, it might be useful to create a [gid.gio2.action.Action] corresponding
    to the `visible-child-name` property of a [[gid.gtk4.stack.Stack]](https://docs.gtk.org/gtk4/class.Stack.html)
    so that the current page can be switched from a menu.  The active radio
    indication in the menu is then directly determined from the active page of
    the [gid.gtk4.stack.Stack].
    
    An anti-example would be binding the `active-id` property on a
    [[gid.gtk4.combo_box.ComboBox]](https://docs.gtk.org/gtk4/class.ComboBox.html). This is
    because the state of the combo box itself is probably uninteresting and is
    actually being used to control something else.
    
    Another anti-example would be to bind to the `visible-child-name`
    property of a [[gid.gtk4.stack.Stack]](https://docs.gtk.org/gtk4/class.Stack.html) if
    this value is actually stored in [gid.gio2.settings.Settings].  In that case, the
    real source of the value is* [gid.gio2.settings.Settings].  If you want
    a [gid.gio2.action.Action] to control a setting stored in [gid.gio2.settings.Settings],
    see [gid.gio2.settings.Settings.createAction] instead, and possibly combine its
    use with [gid.gio2.settings.Settings.bind].
*/
@gidGir("PropertyAction")
class PropertyAction : gid.gobject2.object.ObjectWrap, gid.gio2.action.Action
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_property_action_get_type != &gidSymbolNotFound ? g_property_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GPropertyAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override PropertyAction self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.property_action.PropertyAction]
      Returns: New builder object
  */
  static PropertyActionGidBuilder builder() nothrow
  {
    return new PropertyActionGidBuilder;
  }

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
        
        If the action is disabled then calls to [gid.gio2.action.Action.activate] and
        [gid.gio2.action.Action.changeState] have no effect.
  */
  @property bool enabled() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("enabled");
  }

  /**
      Get `invertBoolean` property.
      Returns: If true, the state of the action will be the negation of the
        property value, provided the property is boolean.
  */
  @property bool invertBoolean() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("invert-boolean");
  }

  /**
      Get `name` property.
      Returns: The name of the action.  This is mostly meaningful for identifying
        the action once it has been added to a #GActionMap.
  */
  @property string name() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("name");
  }

  /**
      Get `parameterType` property.
      Returns: The type of the parameter that must be given when activating the
        action.
  */
  @property gid.glib2.variant_type.VariantType parameterType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.glib2.variant_type.VariantType)("parameter-type");
  }

  /**
      Get `state` property.
      Returns: The state of the action, or null if the action is stateless.
  */
  @property gid.glib2.variant.Variant state() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.glib2.variant.Variant)("state");
  }

  /**
      Get `stateType` property.
      Returns: The #GVariantType of the state that the action has, or null if the
        action is stateless.
  */
  @property gid.glib2.variant_type.VariantType stateType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.glib2.variant_type.VariantType)("state-type");
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
  this(string name, gid.gobject2.object.ObjectWrap object, string propertyName) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GPropertyAction* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
      _cretval = g_property_action_new(_name, object ? cast(GObject*)object._cPtr(No.Dup) : null, _propertyName);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.property_action.PropertyAction]
class PropertyActionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();

  /**
      Set `invertBoolean` property.
      Params:
        propval = If true, the state of the action will be the negation of the
          property value, provided the property is boolean.
      Returns: Builder instance for fluent chaining
  */
  T invertBoolean(bool propval) nothrow
  {
    return setProperty("invert-boolean", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the action.  This is mostly meaningful for identifying
          the action once it has been added to a #GActionMap.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `object` property.
      Params:
        propval = The object to wrap a property on.
          
          The object must be a non-null #GObject with properties.
      Returns: Builder instance for fluent chaining
  */
  T object(gid.gobject2.object.ObjectWrap propval) nothrow
  {
    return setProperty("object", propval);
  }

  /**
      Set `propertyName` property.
      Params:
        propval = The name of the property to wrap on the object.
          
          The property must exist on the passed-in object and it must be
          readable and writable (and not construct-only).
      Returns: Builder instance for fluent chaining
  */
  T propertyName(string propval) nothrow
  {
    return setProperty("property-name", propval);
  }
}

/// Fluent builder for [gid.gio2.property_action.PropertyAction]
final class PropertyActionGidBuilder : PropertyActionGidBuilderImpl!PropertyActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PropertyAction build() nothrow
  {
    return new PropertyAction(cast(void*)createGObject(PropertyAction._getGType), Yes.Take);
  }
}
