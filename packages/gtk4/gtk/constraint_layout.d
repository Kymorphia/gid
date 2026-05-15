/// Module for [ConstraintLayout] class
module gtk.constraint_layout;

import gid.gid;
import gio.list_model;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint;
import gtk.constraint_guide;
import gtk.constraint_target;
import gtk.layout_manager;
import gtk.types;

/**
    A layout manager using constraints to describe relations between widgets.
    
    [gtk.constraint_layout.ConstraintLayout] is a layout manager that uses relations between
    widget attributes, expressed via [gtk.constraint.Constraint] instances, to
    measure and allocate widgets.
    
    ### How do constraints work
    
    Constraints are objects defining the relationship between attributes
    of a widget; you can read the description of the [gtk.constraint.Constraint]
    class to have a more in depth definition.
    
    By taking multiple constraints and applying them to the children of
    a widget using [gtk.constraint_layout.ConstraintLayout], it's possible to describe
    complex layout policies; each constraint applied to a child or to the parent
    widgets contributes to the full description of the layout, in terms of
    parameters for resolving the value of each attribute.
    
    It is important to note that a layout is defined by the totality of
    constraints; removing a child, or a constraint, from an existing layout
    without changing the remaining constraints may result in an unstable
    or unsolvable layout.
    
    Constraints have an implicit "reading order"; you should start describing
    each edge of each child, as well as their relationship with the parent
    container, from the top left (or top right, in RTL languages), horizontally
    first, and then vertically.
    
    A constraint-based layout with too few constraints can become "unstable",
    that is: have more than one solution. The behavior of an unstable layout
    is undefined.
    
    A constraint-based layout with conflicting constraints may be unsolvable,
    and lead to an unstable layout. You can use the [gtk.constraint.Constraint.strength]
    property of [gtk.constraint.Constraint] to "nudge" the layout towards a solution.
    
    ### GtkConstraintLayout as GtkBuildable
    
    [gtk.constraint_layout.ConstraintLayout] implements the [gtk.buildable.Buildable] interface and
    has a custom "constraints" element which allows describing constraints in
    a [gtk.builder.Builder] UI file.
    
    An example of a UI definition fragment specifying a constraint:
    
    ```xml
      <object class="GtkConstraintLayout">
        <constraints>
          <constraint target="button" target-attribute="start"
                      relation="eq"
                      source="super" source-attribute="start"
                      constant="12"
                      strength="required" />
          <constraint target="button" target-attribute="width"
                      relation="ge"
                      constant="250"
                      strength="strong" />
        </constraints>
      </object>
    ```
    
    The definition above will add two constraints to the GtkConstraintLayout:
    
     - a required constraint between the leading edge of "button" and
       the leading edge of the widget using the constraint layout, plus
       12 pixels
     - a strong, constant constraint making the width of "button" greater
       than, or equal to 250 pixels
    
    The "target" and "target-attribute" attributes are required.
    
    The "source" and "source-attribute" attributes of the "constraint"
    element are optional; if they are not specified, the constraint is
    assumed to be a constant.
    
    The "relation" attribute is optional; if not specified, the constraint
    is assumed to be an equality.
    
    The "strength" attribute is optional; if not specified, the constraint
    is assumed to be required.
    
    The "source" and "target" attributes can be set to "super" to indicate
    that the constraint target is the widget using the GtkConstraintLayout.
    
    There can be "constant" and "multiplier" attributes.
    
    Additionally, the "constraints" element can also contain a description
    of the `GtkConstraintGuides` used by the layout:
    
    ```xml
      <constraints>
        <guide min-width="100" max-width="500" name="hspace"/>
        <guide min-height="64" nat-height="128" name="vspace" strength="strong"/>
      </constraints>
    ```
    
    The "guide" element has the following optional attributes:
    
      - "min-width", "nat-width", and "max-width", describe the minimum,
        natural, and maximum width of the guide, respectively
      - "min-height", "nat-height", and "max-height", describe the minimum,
        natural, and maximum height of the guide, respectively
      - "strength" describes the strength of the constraint on the natural
        size of the guide; if not specified, the constraint is assumed to
        have a medium strength
      - "name" describes a name for the guide, useful when debugging
    
    ### Using the Visual Format Language
    
    Complex constraints can be described using a compact syntax called VFL,
    or *Visual Format Language*.
    
    The Visual Format Language describes all the constraints on a row or
    column, typically starting from the leading edge towards the trailing
    one. Each element of the layout is composed by "views", which identify
    a [gtk.constraint_target.ConstraintTarget].
    
    For instance:
    
    ```
      [button]-[textField]
    ```
    
    Describes a constraint that binds the trailing edge of "button" to the
    leading edge of "textField", leaving a default space between the two.
    
    Using VFL is also possible to specify predicates that describe constraints
    on attributes like width and height:
    
    ```
      // Width must be greater than, or equal to 50
      [button(>=50)]
    
      // Width of button1 must be equal to width of button2
      [button1(==button2)]
    ```
    
    The default orientation for a VFL description is horizontal, unless
    otherwise specified:
    
    ```
      // horizontal orientation, default attribute: width
      H:[button(>=150)]
    
      // vertical orientation, default attribute: height
      V:[button1(==button2)]
    ```
    
    It's also possible to specify multiple predicates, as well as their
    strength:
    
    ```
      // minimum width of button must be 150
      // natural width of button can be 250
      [button(>=150@required, ==250@medium)]
    ```
    
    Finally, it's also possible to use simple arithmetic operators:
    
    ```
      // width of button1 must be equal to width of button2
      // divided by 2 plus 12
      [button1(button2 / 2 + 12)]
    ```
*/
class ConstraintLayout : gtk.layout_manager.LayoutManager, gtk.buildable.Buildable
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
    return cast(void function())gtk_constraint_layout_get_type != &gidSymbolNotFound ? gtk_constraint_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ConstraintLayout self()
  {
    return this;
  }

  /**
      Get builder for [gtk.constraint_layout.ConstraintLayout]
      Returns: New builder object
  */
  static ConstraintLayoutGidBuilder builder()
  {
    return new ConstraintLayoutGidBuilder;
  }

  mixin BuildableT!();

  /**
      Creates a new [gtk.constraint_layout.ConstraintLayout] layout manager.
      Returns: the newly created [gtk.constraint_layout.ConstraintLayout]
  */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_constraint_layout_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a constraint to the layout manager.
      
      The [gtk.constraint.Constraint.source] and [gtk.constraint.Constraint.target]
      properties of `constraint` can be:
      
       - set to `NULL` to indicate that the constraint refers to the
         widget using `layout`
       - set to the [gtk.widget.Widget] using `layout`
       - set to a child of the [gtk.widget.Widget] using `layout`
       - set to a [gtk.constraint_guide.ConstraintGuide] that is part of `layout`
      
      The layout acquires the ownership of constraint after calling
      this function.
  
      Params:
        constraint = a [gtk.constraint.Constraint]
  */
  void addConstraint(gtk.constraint.Constraint constraint)
  {
    gtk_constraint_layout_add_constraint(cast(GtkConstraintLayout*)this._cPtr, constraint ? cast(GtkConstraint*)constraint._cPtr(Yes.Dup) : null);
  }

  /**
      Creates a list of constraints from a VFL description.
      
      The Visual Format Language, VFL, is based on Apple's AutoLayout [VFL](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html).
      
      The `views` dictionary is used to match [gtk.constraint_target.ConstraintTarget]
      instances to the symbolic view name inside the VFL.
      
      The VFL grammar is:
      
      ```
             <visualFormatString> = (<orientation>)?
                                    (<superview><connection>)?
                                    <view>(<connection><view>)*
                                    (<connection><superview>)?
                    <orientation> = 'H' | 'V'
                      <superview> = '|'
                     <connection> = '' | '-' <predicateList> '-' | '-'
                  <predicateList> = <simplePredicate> | <predicateListWithParens>
                <simplePredicate> = <metricName> | <positiveNumber>
        <predicateListWithParens> = '(' <predicate> (',' <predicate>)* ')'
                      <predicate> = (<relation>)? <objectOfPredicate> (<operatorList>)? ('@' <priority>)?
                       <relation> = '==' | '<=' | '>='
              <objectOfPredicate> = <constant> | <viewName> | ('.' <attributeName>)?
                       <priority> = <positiveNumber> | 'required' | 'strong' | 'medium' | 'weak'
                       <constant> = <number>
                   <operatorList> = (<multiplyOperator>)? (<addOperator>)?
               <multiplyOperator> = [ '*' | '/' ] <positiveNumber>
                    <addOperator> = [ '+' | '-' ] <positiveNumber>
                       <viewName> = [A-Za-z_]([A-Za-z0-9_]*) // A C identifier
                     <metricName> = [A-Za-z_]([A-Za-z0-9_]*) // A C identifier
                  <attributeName> = 'top' | 'bottom' | 'left' | 'right' | 'width' | 'height' |
                                    'start' | 'end' | 'centerX' | 'centerY' | 'baseline'
                 <positiveNumber> // A positive real number parseable by g_ascii_strtod()
                         <number> // A real number parseable by g_ascii_strtod()
      ```
      
      **Note**: The VFL grammar used by GTK is slightly different than the one
      defined by Apple, as it can use symbolic values for the constraint's
      strength instead of numeric values; additionally, GTK allows adding
      simple arithmetic operations inside predicates.
      
      Examples of VFL descriptions are:
      
      ```
        // Default spacing
        [button]-[textField]
      
        // Width constraint
        [button(>=50)]
      
        // Connection to super view
        |-50-[purpleBox]-50-|
      
        // Vertical layout
        V:[topField]-10-[bottomField]
      
        // Flush views
        [maroonView][blueView]
      
        // Priority
        [button(100strong)]
      
        // Equal widths
        [button1(==button2)]
      
        // Multiple predicates
        [flexibleButton(>=70,<=100)]
      
        // A complete line of layout
        |-[find]-[findNext]-[findField(>=20)]-|
      
        // Operators
        [button1(button2 / 3 + 50)]
      
        // Named attributes
        [button1(==button2.height)]
      ```
  
      Params:
        lines = an array of Visual Format Language lines
            defining a set of constraints
        hspacing = default horizontal spacing value, or -1 for the fallback value
        vspacing = default vertical spacing value, or -1 for the fallback value
        views = a dictionary of `[ name, target ]`
            pairs; the `name` keys map to the view names in the VFL lines, while
            the `target` values map to children of the widget using a [gtk.constraint_layout.ConstraintLayout],
            or guides
      Returns: the list of
          [gtk.constraint.Constraint] instances that were added to the layout
      Throws: [ErrorWrap]
  */
  gtk.constraint.Constraint[] addConstraintsFromDescription(string[] lines, int hspacing, int vspacing, gtk.constraint_target.ConstraintTarget[string] views)
  {
    GList* _cretval;
    size_t _nLines;
    if (lines)
      _nLines = cast(size_t)lines.length;

    char*[] _tmplines;
    foreach (s; lines)
      _tmplines ~= s.toCString(No.Alloc);
    const(char*)* _lines = _tmplines.ptr;

    auto _views = gHashTableFromD!(string, gtk.constraint_target.ConstraintTarget)(views);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_views);
    GError *_err;
    _cretval = gtk_constraint_layout_add_constraints_from_descriptionv(cast(GtkConstraintLayout*)this._cPtr, _lines, _nLines, hspacing, vspacing, _views, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gtk.constraint.Constraint, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Adds a guide to `layout`.
      
      A guide can be used as the source or target of constraints,
      like a widget, but it is not visible.
      
      The `layout` acquires the ownership of `guide` after calling
      this function.
  
      Params:
        guide = a [gtk.constraint_guide.ConstraintGuide] object
  */
  void addGuide(gtk.constraint_guide.ConstraintGuide guide)
  {
    gtk_constraint_layout_add_guide(cast(GtkConstraintLayout*)this._cPtr, guide ? cast(GtkConstraintGuide*)guide._cPtr(Yes.Dup) : null);
  }

  /**
      Returns a [gio.list_model.ListModel] to track the constraints that are
      part of the layout.
      
      Calling this function will enable extra internal bookkeeping
      to track constraints and emit signals on the returned listmodel.
      It may slow down operations a lot.
      
      Applications should try hard to avoid calling this function
      because of the slowdowns.
      Returns: a
          [gio.list_model.ListModel] tracking the layout's constraints
  */
  gio.list_model.ListModel observeConstraints()
  {
    GListModel* _cretval;
    _cretval = gtk_constraint_layout_observe_constraints(cast(GtkConstraintLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] to track the guides that are
      part of the layout.
      
      Calling this function will enable extra internal bookkeeping
      to track guides and emit signals on the returned listmodel.
      It may slow down operations a lot.
      
      Applications should try hard to avoid calling this function
      because of the slowdowns.
      Returns: a
          [gio.list_model.ListModel] tracking the layout's guides
  */
  gio.list_model.ListModel observeGuides()
  {
    GListModel* _cretval;
    _cretval = gtk_constraint_layout_observe_guides(cast(GtkConstraintLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes all constraints from the layout manager.
  */
  void removeAllConstraints()
  {
    gtk_constraint_layout_remove_all_constraints(cast(GtkConstraintLayout*)this._cPtr);
  }

  /**
      Removes `constraint` from the layout manager,
      so that it no longer influences the layout.
  
      Params:
        constraint = a [gtk.constraint.Constraint]
  */
  void removeConstraint(gtk.constraint.Constraint constraint)
  {
    gtk_constraint_layout_remove_constraint(cast(GtkConstraintLayout*)this._cPtr, constraint ? cast(GtkConstraint*)constraint._cPtr(No.Dup) : null);
  }

  /**
      Removes `guide` from the layout manager,
      so that it no longer influences the layout.
  
      Params:
        guide = a [gtk.constraint_guide.ConstraintGuide] object
  */
  void removeGuide(gtk.constraint_guide.ConstraintGuide guide)
  {
    gtk_constraint_layout_remove_guide(cast(GtkConstraintLayout*)this._cPtr, guide ? cast(GtkConstraintGuide*)guide._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.constraint_layout.ConstraintLayout]
class ConstraintLayoutGidBuilderImpl(T) : gtk.layout_manager.LayoutManagerGidBuilderImpl!T, gtk.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();
}

/// Fluent builder for [gtk.constraint_layout.ConstraintLayout]
final class ConstraintLayoutGidBuilder : ConstraintLayoutGidBuilderImpl!ConstraintLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConstraintLayout build()
  {
    return new ConstraintLayout(cast(void*)createGObject(ConstraintLayout._getGType), Yes.Take);
  }
}
