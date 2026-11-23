/// Module for [Constraint] class
module gid.gtk4.constraint;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.types;

/**
    Describes a constraint between attributes of two widgets,
     expressed as a linear equation.
    
    The typical equation for a constraint is:
    
    ```
      target.target_attr = source.source_attr × multiplier + constant
    ```
    
    Each [gid.gtk4.constraint.Constraint] is part of a system that will be solved by a
    [gid.gtk4.constraint_layout.ConstraintLayout] in order to allocate and position each
    child widget or guide.
    
    The source and target, as well as their attributes, of a [gid.gtk4.constraint.Constraint]
    instance are immutable after creation.
*/
class Constraint : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_get_type != &gidSymbolNotFound ? gtk_constraint_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkConstraint";
  }

  /** Returns `this`, for use in `with` statements. */
  override Constraint self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.constraint.Constraint]
      Returns: New builder object
  */
  static ConstraintGidBuilder builder() nothrow
  {
    return new ConstraintGidBuilder;
  }

  /**
      Get `constant` property.
      Returns: The constant value to be added to the [gid.gtk4.constraint.Constraint.sourceAttribute].
  */
  @property double constant() nothrow
  {
    return getConstant();
  }

  /**
      Get `multiplier` property.
      Returns: The multiplication factor to be applied to
        the [gid.gtk4.constraint.Constraint.sourceAttribute].
  */
  @property double multiplier() nothrow
  {
    return getMultiplier();
  }

  /**
      Get `relation` property.
      Returns: The order relation between the terms of the constraint.
  */
  @property gid.gtk4.types.ConstraintRelation relation() nothrow
  {
    return getRelation();
  }

  /**
      Get `source` property.
      Returns: The source of the constraint.
        
        The constraint will set the [gid.gtk4.constraint.Constraint.targetAttribute]
        property of the target using the [gid.gtk4.constraint.Constraint.sourceAttribute]
        property of the source.
  */
  @property gid.gtk4.constraint_target.ConstraintTarget source() nothrow
  {
    return getSource();
  }

  /**
      Get `sourceAttribute` property.
      Returns: The attribute of the [gid.gtk4.constraint.Constraint.source] read by the
        constraint.
  */
  @property gid.gtk4.types.ConstraintAttribute sourceAttribute() nothrow
  {
    return getSourceAttribute();
  }

  /**
      Get `strength` property.
      Returns: The strength of the constraint.
        
        The strength can be expressed either using one of the symbolic values
        of the [gid.gtk4.types.ConstraintStrength] enumeration, or any positive integer
        value.
  */
  @property int strength() nothrow
  {
    return getStrength();
  }

  /**
      Get `target` property.
      Returns: The target of the constraint.
        
        The constraint will set the [gid.gtk4.constraint.Constraint.targetAttribute]
        property of the target using the [gid.gtk4.constraint.Constraint.sourceAttribute]
        property of the source widget.
  */
  @property gid.gtk4.constraint_target.ConstraintTarget target() nothrow
  {
    return getTarget();
  }

  /**
      Get `targetAttribute` property.
      Returns: The attribute of the [gid.gtk4.constraint.Constraint.target] set by the constraint.
  */
  @property gid.gtk4.types.ConstraintAttribute targetAttribute() nothrow
  {
    return getTargetAttribute();
  }

  /**
      Creates a new constraint representing a relation between a layout
      attribute on a source and a layout attribute on a target.
  
      Params:
        target = the target of the constraint
        targetAttribute = the attribute of `target` to be set
        relation = the relation equivalence between `target_attribute` and `source_attribute`
        source = the source of the constraint
        sourceAttribute = the attribute of `source` to be read
        multiplier = a multiplication factor to be applied to `source_attribute`
        constant = a constant factor to be added to `source_attribute`
        strength = the strength of the constraint
      Returns: the newly created constraint
  */
  this(gid.gtk4.constraint_target.ConstraintTarget target, gid.gtk4.types.ConstraintAttribute targetAttribute, gid.gtk4.types.ConstraintRelation relation, gid.gtk4.constraint_target.ConstraintTarget source, gid.gtk4.types.ConstraintAttribute sourceAttribute, double multiplier, double constant, int strength) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkConstraint* _cretval;
      _cretval = gtk_constraint_new(target ? cast(GtkConstraintTarget*)(cast(gid.gobject2.object.ObjectWrap)target)._cPtr(No.Dup) : null, targetAttribute, relation, source ? cast(GtkConstraintTarget*)(cast(gid.gobject2.object.ObjectWrap)source)._cPtr(No.Dup) : null, sourceAttribute, multiplier, constant, strength);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new constraint representing a relation between a layout
      attribute on a target and a constant value.
  
      Params:
        target = a the target of the constraint
        targetAttribute = the attribute of `target` to be set
        relation = the relation equivalence between `target_attribute` and `constant`
        constant = a constant factor to be set on `target_attribute`
        strength = the strength of the constraint
      Returns: the newly created constraint
  */
  static gid.gtk4.constraint.Constraint newConstant(gid.gtk4.constraint_target.ConstraintTarget target, gid.gtk4.types.ConstraintAttribute targetAttribute, gid.gtk4.types.ConstraintRelation relation, double constant, int strength) nothrow
  {
    GtkConstraint* _cretval;
    _cretval = gtk_constraint_new_constant(target ? cast(GtkConstraintTarget*)(cast(gid.gobject2.object.ObjectWrap)target)._cPtr(No.Dup) : null, targetAttribute, relation, constant, strength);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.constraint.Constraint)(cast(GtkConstraint*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the constant factor added to the source attributes' value.
      Returns: a constant factor
  */
  double getConstant() nothrow
  {
    double _retval;
    _retval = gtk_constraint_get_constant(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the multiplication factor applied to the source
      attribute's value.
      Returns: a multiplication factor
  */
  double getMultiplier() nothrow
  {
    double _retval;
    _retval = gtk_constraint_get_multiplier(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      The order relation between the terms of the constraint.
      Returns: a relation type
  */
  gid.gtk4.types.ConstraintRelation getRelation() nothrow
  {
    GtkConstraintRelation _cretval;
    _cretval = gtk_constraint_get_relation(cast(GtkConstraint*)this._cPtr);
    gid.gtk4.types.ConstraintRelation _retval = cast(gid.gtk4.types.ConstraintRelation)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.constraint_target.ConstraintTarget] used as the source for the
      constraint.
      
      If the source is set to `NULL` at creation, the constraint will use
      the widget using the [gid.gtk4.constraint_layout.ConstraintLayout] as the source.
      Returns: the source of the constraint
  */
  gid.gtk4.constraint_target.ConstraintTarget getSource() nothrow
  {
    GtkConstraintTarget* _cretval;
    _cretval = gtk_constraint_get_source(cast(GtkConstraint*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.constraint_target.ConstraintTarget)(cast(GtkConstraintTarget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the attribute of the source to be read by the constraint.
      Returns: the source's attribute
  */
  gid.gtk4.types.ConstraintAttribute getSourceAttribute() nothrow
  {
    GtkConstraintAttribute _cretval;
    _cretval = gtk_constraint_get_source_attribute(cast(GtkConstraint*)this._cPtr);
    gid.gtk4.types.ConstraintAttribute _retval = cast(gid.gtk4.types.ConstraintAttribute)_cretval;
    return _retval;
  }

  /**
      Retrieves the strength of the constraint.
      Returns: the strength value
  */
  int getStrength() nothrow
  {
    int _retval;
    _retval = gtk_constraint_get_strength(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.constraint_target.ConstraintTarget] used as the target for
      the constraint.
      
      If the targe is set to `NULL` at creation, the constraint will use
      the widget using the [gid.gtk4.constraint_layout.ConstraintLayout] as the target.
      Returns: a [gid.gtk4.constraint_target.ConstraintTarget]
  */
  gid.gtk4.constraint_target.ConstraintTarget getTarget() nothrow
  {
    GtkConstraintTarget* _cretval;
    _cretval = gtk_constraint_get_target(cast(GtkConstraint*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.constraint_target.ConstraintTarget)(cast(GtkConstraintTarget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the attribute of the target to be set by the constraint.
      Returns: the target's attribute
  */
  gid.gtk4.types.ConstraintAttribute getTargetAttribute() nothrow
  {
    GtkConstraintAttribute _cretval;
    _cretval = gtk_constraint_get_target_attribute(cast(GtkConstraint*)this._cPtr);
    gid.gtk4.types.ConstraintAttribute _retval = cast(gid.gtk4.types.ConstraintAttribute)_cretval;
    return _retval;
  }

  /**
      Checks whether the constraint is attached to a [gid.gtk4.constraint_layout.ConstraintLayout],
      and it is contributing to the layout.
      Returns: `TRUE` if the constraint is attached
  */
  bool isAttached() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_constraint_is_attached(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the constraint describes a relation between an attribute
      on the [gid.gtk4.constraint.Constraint.target] and a constant value.
      Returns: `TRUE` if the constraint is a constant relation
  */
  bool isConstant() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_constraint_is_constant(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the constraint is a required relation for solving the
      constraint layout.
      Returns: true if the constraint is required
  */
  bool isRequired() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_constraint_is_required(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.constraint.Constraint]
class ConstraintGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `constant` property.
      Params:
        propval = The constant value to be added to the [gid.gtk4.constraint.Constraint.sourceAttribute].
      Returns: Builder instance for fluent chaining
  */
  T constant(double propval) nothrow
  {
    return setProperty("constant", propval);
  }

  /**
      Set `multiplier` property.
      Params:
        propval = The multiplication factor to be applied to
          the [gid.gtk4.constraint.Constraint.sourceAttribute].
      Returns: Builder instance for fluent chaining
  */
  T multiplier(double propval) nothrow
  {
    return setProperty("multiplier", propval);
  }

  /**
      Set `relation` property.
      Params:
        propval = The order relation between the terms of the constraint.
      Returns: Builder instance for fluent chaining
  */
  T relation(gid.gtk4.types.ConstraintRelation propval) nothrow
  {
    return setProperty("relation", propval);
  }

  /**
      Set `source` property.
      Params:
        propval = The source of the constraint.
          
          The constraint will set the [gid.gtk4.constraint.Constraint.targetAttribute]
          property of the target using the [gid.gtk4.constraint.Constraint.sourceAttribute]
          property of the source.
      Returns: Builder instance for fluent chaining
  */
  T source(gid.gtk4.constraint_target.ConstraintTarget propval) nothrow
  {
    return setProperty("source", propval);
  }

  /**
      Set `sourceAttribute` property.
      Params:
        propval = The attribute of the [gid.gtk4.constraint.Constraint.source] read by the
          constraint.
      Returns: Builder instance for fluent chaining
  */
  T sourceAttribute(gid.gtk4.types.ConstraintAttribute propval) nothrow
  {
    return setProperty("source-attribute", propval);
  }

  /**
      Set `strength` property.
      Params:
        propval = The strength of the constraint.
          
          The strength can be expressed either using one of the symbolic values
          of the [gid.gtk4.types.ConstraintStrength] enumeration, or any positive integer
          value.
      Returns: Builder instance for fluent chaining
  */
  T strength(int propval) nothrow
  {
    return setProperty("strength", propval);
  }

  /**
      Set `target` property.
      Params:
        propval = The target of the constraint.
          
          The constraint will set the [gid.gtk4.constraint.Constraint.targetAttribute]
          property of the target using the [gid.gtk4.constraint.Constraint.sourceAttribute]
          property of the source widget.
      Returns: Builder instance for fluent chaining
  */
  T target(gid.gtk4.constraint_target.ConstraintTarget propval) nothrow
  {
    return setProperty("target", propval);
  }

  /**
      Set `targetAttribute` property.
      Params:
        propval = The attribute of the [gid.gtk4.constraint.Constraint.target] set by the constraint.
      Returns: Builder instance for fluent chaining
  */
  T targetAttribute(gid.gtk4.types.ConstraintAttribute propval) nothrow
  {
    return setProperty("target-attribute", propval);
  }
}

/// Fluent builder for [gid.gtk4.constraint.Constraint]
final class ConstraintGidBuilder : ConstraintGidBuilderImpl!ConstraintGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Constraint build() nothrow
  {
    return new Constraint(cast(void*)createGObject(Constraint._getGType), Yes.Take);
  }
}
