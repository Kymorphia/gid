/// Module for [Constraint] class
module gtk.constraint;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.types;

/**
    [gtk.constraint.Constraint] describes a constraint between attributes of two widgets,
     expressed as a linear equation.
    
    The typical equation for a constraint is:
    
    ```
      target.target_attr = source.source_attr × multiplier + constant
    ```
    
    Each [gtk.constraint.Constraint] is part of a system that will be solved by a
    [gtk.constraint_layout.ConstraintLayout] in order to allocate and position each
    child widget or guide.
    
    The source and target, as well as their attributes, of a [gtk.constraint.Constraint]
    instance are immutable after creation.
*/
class Constraint : gobject.object.ObjectWrap
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
    return cast(void function())gtk_constraint_get_type != &gidSymbolNotFound ? gtk_constraint_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Constraint self()
  {
    return this;
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
  this(gtk.constraint_target.ConstraintTarget target, gtk.types.ConstraintAttribute targetAttribute, gtk.types.ConstraintRelation relation, gtk.constraint_target.ConstraintTarget source, gtk.types.ConstraintAttribute sourceAttribute, double multiplier, double constant, int strength)
  {
    GtkConstraint* _cretval;
    _cretval = gtk_constraint_new(target ? cast(GtkConstraintTarget*)(cast(gobject.object.ObjectWrap)target)._cPtr(No.Dup) : null, targetAttribute, relation, source ? cast(GtkConstraintTarget*)(cast(gobject.object.ObjectWrap)source)._cPtr(No.Dup) : null, sourceAttribute, multiplier, constant, strength);
    this(_cretval, Yes.Take);
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
  static gtk.constraint.Constraint newConstant(gtk.constraint_target.ConstraintTarget target, gtk.types.ConstraintAttribute targetAttribute, gtk.types.ConstraintRelation relation, double constant, int strength)
  {
    GtkConstraint* _cretval;
    _cretval = gtk_constraint_new_constant(target ? cast(GtkConstraintTarget*)(cast(gobject.object.ObjectWrap)target)._cPtr(No.Dup) : null, targetAttribute, relation, constant, strength);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.constraint.Constraint)(cast(GtkConstraint*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the constant factor added to the source attributes' value.
      Returns: a constant factor
  */
  double getConstant()
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
  double getMultiplier()
  {
    double _retval;
    _retval = gtk_constraint_get_multiplier(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      The order relation between the terms of the constraint.
      Returns: a relation type
  */
  gtk.types.ConstraintRelation getRelation()
  {
    GtkConstraintRelation _cretval;
    _cretval = gtk_constraint_get_relation(cast(GtkConstraint*)this._cPtr);
    gtk.types.ConstraintRelation _retval = cast(gtk.types.ConstraintRelation)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gtk.constraint_target.ConstraintTarget] used as the source for the
      constraint.
      
      If the source is set to `NULL` at creation, the constraint will use
      the widget using the [gtk.constraint_layout.ConstraintLayout] as the source.
      Returns: the source of the constraint
  */
  gtk.constraint_target.ConstraintTarget getSource()
  {
    GtkConstraintTarget* _cretval;
    _cretval = gtk_constraint_get_source(cast(GtkConstraint*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.constraint_target.ConstraintTarget)(cast(GtkConstraintTarget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the attribute of the source to be read by the constraint.
      Returns: the source's attribute
  */
  gtk.types.ConstraintAttribute getSourceAttribute()
  {
    GtkConstraintAttribute _cretval;
    _cretval = gtk_constraint_get_source_attribute(cast(GtkConstraint*)this._cPtr);
    gtk.types.ConstraintAttribute _retval = cast(gtk.types.ConstraintAttribute)_cretval;
    return _retval;
  }

  /**
      Retrieves the strength of the constraint.
      Returns: the strength value
  */
  int getStrength()
  {
    int _retval;
    _retval = gtk_constraint_get_strength(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the [gtk.constraint_target.ConstraintTarget] used as the target for
      the constraint.
      
      If the targe is set to `NULL` at creation, the constraint will use
      the widget using the [gtk.constraint_layout.ConstraintLayout] as the target.
      Returns: a [gtk.constraint_target.ConstraintTarget]
  */
  gtk.constraint_target.ConstraintTarget getTarget()
  {
    GtkConstraintTarget* _cretval;
    _cretval = gtk_constraint_get_target(cast(GtkConstraint*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.constraint_target.ConstraintTarget)(cast(GtkConstraintTarget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the attribute of the target to be set by the constraint.
      Returns: the target's attribute
  */
  gtk.types.ConstraintAttribute getTargetAttribute()
  {
    GtkConstraintAttribute _cretval;
    _cretval = gtk_constraint_get_target_attribute(cast(GtkConstraint*)this._cPtr);
    gtk.types.ConstraintAttribute _retval = cast(gtk.types.ConstraintAttribute)_cretval;
    return _retval;
  }

  /**
      Checks whether the constraint is attached to a [gtk.constraint_layout.ConstraintLayout],
      and it is contributing to the layout.
      Returns: `TRUE` if the constraint is attached
  */
  bool isAttached()
  {
    bool _retval;
    _retval = cast(bool)gtk_constraint_is_attached(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the constraint describes a relation between an attribute
      on the [gtk.constraint.Constraint.target] and a constant value.
      Returns: `TRUE` if the constraint is a constant relation
  */
  bool isConstant()
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
  bool isRequired()
  {
    bool _retval;
    _retval = cast(bool)gtk_constraint_is_required(cast(GtkConstraint*)this._cPtr);
    return _retval;
  }
}
