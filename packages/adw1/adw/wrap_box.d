/// Module for [WrapBox] class
module adw.wrap_box;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.widget;

/**
    A box-like widget that can wrap into multiple lines.
    
    <picture>
      <source srcset="wrap-box-dark.png" media="(prefers-color-scheme: dark)">
      <img src="wrap-box.png" alt="wrap-box">
    </picture>
    
    [adw.wrap_box.WrapBox] is similar to [gtk.box.Box], but can wrap lines when the
    widgets cannot fit otherwise. Unlike [gtk.flow_box.FlowBox], the children aren't
    arranged into a grid and behave more like words in a wrapping label.
    
    Like [gtk.box.Box], [adw.wrap_box.WrapBox] is orientable and has spacing:
    
    - [adw.wrap_box.WrapBox.childSpacing] between children in the same line;
    - [adw.wrap_box.WrapBox.lineSpacing] between lines.
    
    ::: note
        Unlike [gtk.box.Box], [adw.wrap_box.WrapBox] cannot follow the CSS `border-spacing`
        property.
    
    Use the [adw.wrap_box.WrapBox.naturalLineLength] property to determine the
    layout's natural size, e.g. when using it in a [gtk.popover.Popover].
    
    Normally, a horizontal [adw.wrap_box.WrapBox] wraps left to right and top to bottom
    for left-to-right languages. Both of these directions can be reversed, using
    the [adw.wrap_box.WrapBox.packDirection] and [adw.wrap_box.WrapBox.wrapReverse]
    properties. Additionally, the alignment of each line can be controlled with
    the [adw.wrap_box.WrapBox.align_] property.
    
    Lines can be justified using the [adw.wrap_box.WrapBox.justify] property, filling
    the entire line by either increasing child size or spacing depending on the
    value. Set [adw.wrap_box.WrapBox.justifyLastLine] to justify the last line as
    well.
    
    By default, [adw.wrap_box.WrapBox] wraps as soon as the previous line cannot fit any
    more children without shrinking them past their natural size. Set
    [adw.wrap_box.WrapBox.wrapPolicy] to [adw.types.WrapPolicy.Minimum] to only wrap
    once all the children in the previous line have been shrunk to their minimum
    size.
    
    To make each line take the same amount of space, set
    [adw.wrap_box.WrapBox.lineHomogeneous] to `TRUE`.
    
    Spacing and natural line length can scale with the text scale factor, use the
    [adw.wrap_box.WrapBox.childSpacingUnit], [adw.wrap_box.WrapBox.lineSpacingUnit]
    and/or [adw.wrap_box.WrapBox.naturalLineLengthUnit] properties to enable that
    behavior.
    
    See [adw.wrap_layout.WrapLayout].
    
    ## CSS nodes
    
    [adw.wrap_box.WrapBox] uses a single CSS node with name `wrap-box`.
    
    ## Accessibility
    
    [adw.wrap_box.WrapBox] uses the [gtk.types.AccessibleRole.Group] role.
*/
class WrapBox : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())adw_wrap_box_get_type != &gidSymbolNotFound ? adw_wrap_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwWrapBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override WrapBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.wrap_box.WrapBox]
      Returns: New builder object
  */
  static WrapBoxGidBuilder builder() nothrow
  {
    return new WrapBoxGidBuilder;
  }

  /**
      Get `align_` property.
      Returns: The alignment of the children within each line.
        
        0 means the children are placed at the start of the line, 1 means they are
        placed at the end of the line. 0.5 means they are placed in the middle of
        the line.
        
        Alignment is only used when [adw.wrap_box.WrapBox.justify] is set to
        [adw.types.JustifyMode.None], or on the last line when the
        [adw.wrap_box.WrapBox.justifyLastLine] is `FALSE`.
  */
  @property float align_() nothrow
  {
    return getAlign();
  }

  /**
      Set `align_` property.
      Params:
        propval = The alignment of the children within each line.
          
          0 means the children are placed at the start of the line, 1 means they are
          placed at the end of the line. 0.5 means they are placed in the middle of
          the line.
          
          Alignment is only used when [adw.wrap_box.WrapBox.justify] is set to
          [adw.types.JustifyMode.None], or on the last line when the
          [adw.wrap_box.WrapBox.justifyLastLine] is `FALSE`.
  */
  @property void align_(float propval) nothrow
  {
    setAlign(propval);
  }

  /**
      Get `childSpacing` property.
      Returns: The spacing between widgets on the same line.
        
        See [adw.wrap_box.WrapBox.childSpacingUnit].
  */
  @property int childSpacing() nothrow
  {
    return getChildSpacing();
  }

  /**
      Set `childSpacing` property.
      Params:
        propval = The spacing between widgets on the same line.
          
          See [adw.wrap_box.WrapBox.childSpacingUnit].
  */
  @property void childSpacing(int propval) nothrow
  {
    setChildSpacing(propval);
  }

  /**
      Get `childSpacingUnit` property.
      Returns: The length unit for child spacing.
        
        Allows the spacing to vary depending on the text scale factor.
        
        See [adw.wrap_box.WrapBox.childSpacing].
  */
  @property adw.types.LengthUnit childSpacingUnit() nothrow
  {
    return getChildSpacingUnit();
  }

  /**
      Set `childSpacingUnit` property.
      Params:
        propval = The length unit for child spacing.
          
          Allows the spacing to vary depending on the text scale factor.
          
          See [adw.wrap_box.WrapBox.childSpacing].
  */
  @property void childSpacingUnit(adw.types.LengthUnit propval) nothrow
  {
    setChildSpacingUnit(propval);
  }

  /**
      Get `justify` property.
      Returns: Determines whether and how each complete line should be stretched to fill
        the entire widget.
        
        If set to [adw.types.JustifyMode.Fill], each widget in the line will be
        stretched, keeping consistent spacing, so that the line fills the entire
        widget.
        
        If set to [adw.types.JustifyMode.Spread], the spacing between widgets will
        be increased, keeping widget sizes intact. The first and last widget will
        be aligned with the beginning and end of the line. If the line only
        contains a single widget, it will be stretched regardless.
        
        If set to [adw.types.JustifyMode.None], the line will not be stretched and
        the children will be placed together within the line, according to
        [adw.wrap_box.WrapBox.align_].
        
        By default this doesn't affect the last line, as it will be incomplete. Use
        [adw.wrap_box.WrapBox.justifyLastLine] to justify it as well.
  */
  @property adw.types.JustifyMode justify() nothrow
  {
    return getJustify();
  }

  /**
      Set `justify` property.
      Params:
        propval = Determines whether and how each complete line should be stretched to fill
          the entire widget.
          
          If set to [adw.types.JustifyMode.Fill], each widget in the line will be
          stretched, keeping consistent spacing, so that the line fills the entire
          widget.
          
          If set to [adw.types.JustifyMode.Spread], the spacing between widgets will
          be increased, keeping widget sizes intact. The first and last widget will
          be aligned with the beginning and end of the line. If the line only
          contains a single widget, it will be stretched regardless.
          
          If set to [adw.types.JustifyMode.None], the line will not be stretched and
          the children will be placed together within the line, according to
          [adw.wrap_box.WrapBox.align_].
          
          By default this doesn't affect the last line, as it will be incomplete. Use
          [adw.wrap_box.WrapBox.justifyLastLine] to justify it as well.
  */
  @property void justify(adw.types.JustifyMode propval) nothrow
  {
    setJustify(propval);
  }

  /**
      Get `justifyLastLine` property.
      Returns: Whether the last line should be stretched to fill the entire widget.
        
        See [adw.wrap_box.WrapBox.justify].
  */
  @property bool justifyLastLine() nothrow
  {
    return getJustifyLastLine();
  }

  /**
      Set `justifyLastLine` property.
      Params:
        propval = Whether the last line should be stretched to fill the entire widget.
          
          See [adw.wrap_box.WrapBox.justify].
  */
  @property void justifyLastLine(bool propval) nothrow
  {
    setJustifyLastLine(propval);
  }

  /**
      Get `lineHomogeneous` property.
      Returns: Whether all lines should take the same amount of space.
  */
  @property bool lineHomogeneous() nothrow
  {
    return getLineHomogeneous();
  }

  /**
      Set `lineHomogeneous` property.
      Params:
        propval = Whether all lines should take the same amount of space.
  */
  @property void lineHomogeneous(bool propval) nothrow
  {
    setLineHomogeneous(propval);
  }

  /**
      Get `lineSpacing` property.
      Returns: The spacing between lines.
        
        See [adw.wrap_box.WrapBox.lineSpacingUnit].
  */
  @property int lineSpacing() nothrow
  {
    return getLineSpacing();
  }

  /**
      Set `lineSpacing` property.
      Params:
        propval = The spacing between lines.
          
          See [adw.wrap_box.WrapBox.lineSpacingUnit].
  */
  @property void lineSpacing(int propval) nothrow
  {
    setLineSpacing(propval);
  }

  /**
      Get `lineSpacingUnit` property.
      Returns: The length unit for line spacing.
        
        Allows the spacing to vary depending on the text scale factor.
        
        See [adw.wrap_box.WrapBox.lineSpacing].
  */
  @property adw.types.LengthUnit lineSpacingUnit() nothrow
  {
    return getLineSpacingUnit();
  }

  /**
      Set `lineSpacingUnit` property.
      Params:
        propval = The length unit for line spacing.
          
          Allows the spacing to vary depending on the text scale factor.
          
          See [adw.wrap_box.WrapBox.lineSpacing].
  */
  @property void lineSpacingUnit(adw.types.LengthUnit propval) nothrow
  {
    setLineSpacingUnit(propval);
  }

  /**
      Get `naturalLineLength` property.
      Returns: Determines the natural size for each line.
        
        It should be used to limit the line lengths, for example when used in
        popovers.
        
        See [adw.wrap_box.WrapBox.naturalLineLengthUnit].
  */
  @property int naturalLineLength() nothrow
  {
    return getNaturalLineLength();
  }

  /**
      Set `naturalLineLength` property.
      Params:
        propval = Determines the natural size for each line.
          
          It should be used to limit the line lengths, for example when used in
          popovers.
          
          See [adw.wrap_box.WrapBox.naturalLineLengthUnit].
  */
  @property void naturalLineLength(int propval) nothrow
  {
    setNaturalLineLength(propval);
  }

  /**
      Get `naturalLineLengthUnit` property.
      Returns: The length unit for natural line length.
        
        Allows the length to vary depending on the text scale factor.
        
        See [adw.wrap_box.WrapBox.naturalLineLength].
  */
  @property adw.types.LengthUnit naturalLineLengthUnit() nothrow
  {
    return getNaturalLineLengthUnit();
  }

  /**
      Set `naturalLineLengthUnit` property.
      Params:
        propval = The length unit for natural line length.
          
          Allows the length to vary depending on the text scale factor.
          
          See [adw.wrap_box.WrapBox.naturalLineLength].
  */
  @property void naturalLineLengthUnit(adw.types.LengthUnit propval) nothrow
  {
    setNaturalLineLengthUnit(propval);
  }

  /**
      Get `packDirection` property.
      Returns: The direction children are packed in each line.
  */
  @property adw.types.PackDirection packDirection() nothrow
  {
    return getPackDirection();
  }

  /**
      Set `packDirection` property.
      Params:
        propval = The direction children are packed in each line.
  */
  @property void packDirection(adw.types.PackDirection propval) nothrow
  {
    setPackDirection(propval);
  }

  /**
      Get `wrapPolicy` property.
      Returns: The policy for line wrapping.
        
           + If set to [adw.types.WrapPolicy.Natural], the box will wrap to the next line
        as soon as the previous line cannot fit any more children without shrinking
        them past their natural size.
        
        If set to [adw.types.WrapPolicy.Minimum], the box will try to fit as many
        children into each line as possible, shrinking them down to their minimum
        size before wrapping to the next line.
  */
  @property adw.types.WrapPolicy wrapPolicy() nothrow
  {
    return getWrapPolicy();
  }

  /**
      Set `wrapPolicy` property.
      Params:
        propval = The policy for line wrapping.
          
             + If set to [adw.types.WrapPolicy.Natural], the box will wrap to the next line
          as soon as the previous line cannot fit any more children without shrinking
          them past their natural size.
          
          If set to [adw.types.WrapPolicy.Minimum], the box will try to fit as many
          children into each line as possible, shrinking them down to their minimum
          size before wrapping to the next line.
  */
  @property void wrapPolicy(adw.types.WrapPolicy propval) nothrow
  {
    setWrapPolicy(propval);
  }

  /**
      Get `wrapReverse` property.
      Returns: Whether wrap direction should be reversed.
        
        By default, lines wrap downwards in a horizontal box, and towards the end
        in a vertical box. If set to `TRUE`, they wrap upwards or towards the start
        respectively.
  */
  @property bool wrapReverse() nothrow
  {
    return getWrapReverse();
  }

  /**
      Set `wrapReverse` property.
      Params:
        propval = Whether wrap direction should be reversed.
          
          By default, lines wrap downwards in a horizontal box, and towards the end
          in a vertical box. If set to `TRUE`, they wrap upwards or towards the start
          respectively.
  */
  @property void wrapReverse(bool propval) nothrow
  {
    setWrapReverse(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.wrap_box.WrapBox].
      Returns: the newly created [adw.wrap_box.WrapBox]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_wrap_box_new();
    this(_cretval, No.Take);
  }

  /**
      Adds child as the last child to self.
  
      Params:
        child = the widget to append
  */
  void append(gtk.widget.Widget child) nothrow
  {
    adw_wrap_box_append(cast(AdwWrapBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets the alignment of the children within each line.
      Returns: the child alignment
  */
  float getAlign() nothrow
  {
    float _retval;
    _retval = adw_wrap_box_get_align(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets spacing between widgets on the same line.
      Returns: spacing between widgets on the same line
  */
  int getChildSpacing() nothrow
  {
    int _retval;
    _retval = adw_wrap_box_get_child_spacing(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for child spacing.
      Returns: the length unit
  */
  adw.types.LengthUnit getChildSpacingUnit() nothrow
  {
    AdwLengthUnit _cretval;
    _cretval = adw_wrap_box_get_child_spacing_unit(cast(AdwWrapBox*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Gets whether and how each complete line is stretched to fill the entire widget.
      Returns: the justify mode
  */
  adw.types.JustifyMode getJustify() nothrow
  {
    AdwJustifyMode _cretval;
    _cretval = adw_wrap_box_get_justify(cast(AdwWrapBox*)this._cPtr);
    adw.types.JustifyMode _retval = cast(adw.types.JustifyMode)_cretval;
    return _retval;
  }

  /**
      Gets whether the last line should be stretched to fill the entire widget.
      Returns: whether the last line is justified
  */
  bool getJustifyLastLine() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_wrap_box_get_justify_last_line(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether all lines should take the same amount of space.
      Returns: whether lines should be homogeneous
  */
  bool getLineHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_wrap_box_get_line_homogeneous(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the spacing between lines.
      
      See [adw.wrap_box.WrapBox.lineSpacingUnit].
      Returns: the line spacing
  */
  int getLineSpacing() nothrow
  {
    int _retval;
    _retval = adw_wrap_box_get_line_spacing(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for line spacing.
      Returns: the length unit
  */
  adw.types.LengthUnit getLineSpacingUnit() nothrow
  {
    AdwLengthUnit _cretval;
    _cretval = adw_wrap_box_get_line_spacing_unit(cast(AdwWrapBox*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Gets the natural size for each line.
      Returns: the natural length
  */
  int getNaturalLineLength() nothrow
  {
    int _retval;
    _retval = adw_wrap_box_get_natural_line_length(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for line spacing.
      Returns: the length unit
  */
  adw.types.LengthUnit getNaturalLineLengthUnit() nothrow
  {
    AdwLengthUnit _cretval;
    _cretval = adw_wrap_box_get_natural_line_length_unit(cast(AdwWrapBox*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Gets the direction children are packed in each line.
      Returns: the line direction
  */
  adw.types.PackDirection getPackDirection() nothrow
  {
    AdwPackDirection _cretval;
    _cretval = adw_wrap_box_get_pack_direction(cast(AdwWrapBox*)this._cPtr);
    adw.types.PackDirection _retval = cast(adw.types.PackDirection)_cretval;
    return _retval;
  }

  /**
      Gets the policy for line wrapping.
      Returns: the wrap policy
  */
  adw.types.WrapPolicy getWrapPolicy() nothrow
  {
    AdwWrapPolicy _cretval;
    _cretval = adw_wrap_box_get_wrap_policy(cast(AdwWrapBox*)this._cPtr);
    adw.types.WrapPolicy _retval = cast(adw.types.WrapPolicy)_cretval;
    return _retval;
  }

  /**
      Gets whether wrap direction is reversed.
      Returns: whether wrap direction is reversed
  */
  bool getWrapReverse() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_wrap_box_get_wrap_reverse(cast(AdwWrapBox*)this._cPtr);
    return _retval;
  }

  /**
      Inserts child in the position after sibling in the list of self children.
      
      If sibling is `NULL`, inserts child at the first position.
  
      Params:
        child = the widget to insert
        sibling = the sibling after which to insert child
  */
  void insertChildAfter(gtk.widget.Widget child, gtk.widget.Widget sibling = null) nothrow
  {
    adw_wrap_box_insert_child_after(cast(AdwWrapBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Adds child as the first child to self.
  
      Params:
        child = the widget to prepend
  */
  void prepend(gtk.widget.Widget child) nothrow
  {
    adw_wrap_box_prepend(cast(AdwWrapBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child widget from self.
      
      The child must have been added before with [adw.wrap_box.WrapBox.append],
      [adw.wrap_box.WrapBox.prepend], or [adw.wrap_box.WrapBox.insertChildAfter].
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child) nothrow
  {
    adw_wrap_box_remove(cast(AdwWrapBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes all children from self.
  */
  void removeAll() nothrow
  {
    adw_wrap_box_remove_all(cast(AdwWrapBox*)this._cPtr);
  }

  /**
      Moves child to the position after sibling in the list of self children.
      
      If sibling is `NULL`, moves child to the first position.
  
      Params:
        child = the widget to move, must be a child of self
        sibling = the sibling to move child after
  */
  void reorderChildAfter(gtk.widget.Widget child, gtk.widget.Widget sibling = null) nothrow
  {
    adw_wrap_box_reorder_child_after(cast(AdwWrapBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Sets the alignment of the children within each line.
      
      0 means the children are placed at the start of the line, 1 means they are
      placed at the end of the line. 0.5 means they are placed in the middle of the
      line.
      
      Alignment is only used when [adw.wrap_box.WrapBox.justify] is set to
      [adw.types.JustifyMode.None], or on the last line when the
      [adw.wrap_box.WrapBox.justifyLastLine] is `FALSE`.
  
      Params:
        align_ = the child alignment
  */
  void setAlign(float align_) nothrow
  {
    adw_wrap_box_set_align(cast(AdwWrapBox*)this._cPtr, align_);
  }

  /**
      Sets the spacing between widgets on the same line.
      
      See [adw.wrap_box.WrapBox.childSpacingUnit].
  
      Params:
        childSpacing = the child spacing
  */
  void setChildSpacing(int childSpacing) nothrow
  {
    adw_wrap_box_set_child_spacing(cast(AdwWrapBox*)this._cPtr, childSpacing);
  }

  /**
      Sets the length unit for child spacing.
      
      Allows the spacing to vary depending on the text scale factor.
      
      See [adw.wrap_box.WrapBox.childSpacing].
  
      Params:
        unit = the length unit
  */
  void setChildSpacingUnit(adw.types.LengthUnit unit) nothrow
  {
    adw_wrap_box_set_child_spacing_unit(cast(AdwWrapBox*)this._cPtr, unit);
  }

  /**
      Determines whether and how each complete line should be stretched to fill
      the entire widget.
      
      If set to [adw.types.JustifyMode.Fill], each widget in the line will be
      stretched, keeping consistent spacing, so that the line fills the entire
      widget.
      
      If set to [adw.types.JustifyMode.Spread], the spacing between widgets will be
      increased, keeping widget sizes intact. The first and last widget will be
      aligned with the beginning and end of the line. If the line only contains a
      single widget, it will be stretched regardless.
      
      If set to [adw.types.JustifyMode.None], the line will not be stretched and the
      children will be placed together within the line, according to
      [adw.wrap_box.WrapBox.align_].
      
      By default this doesn't affect the last line, as it will be incomplete. Use
      [adw.wrap_box.WrapBox.justifyLastLine] to justify it as well.
  
      Params:
        justify = the justify mode
  */
  void setJustify(adw.types.JustifyMode justify) nothrow
  {
    adw_wrap_box_set_justify(cast(AdwWrapBox*)this._cPtr, justify);
  }

  /**
      Sets whether the last line should be stretched to fill the entire widget.
      
      See [adw.wrap_box.WrapBox.justify].
  
      Params:
        justifyLastLine = whether to justify the last line
  */
  void setJustifyLastLine(bool justifyLastLine) nothrow
  {
    adw_wrap_box_set_justify_last_line(cast(AdwWrapBox*)this._cPtr, justifyLastLine);
  }

  /**
      Sets whether all lines should take the same amount of space.
  
      Params:
        homogeneous = whether lines should be homogeneous
  */
  void setLineHomogeneous(bool homogeneous) nothrow
  {
    adw_wrap_box_set_line_homogeneous(cast(AdwWrapBox*)this._cPtr, homogeneous);
  }

  /**
      Sets the spacing between lines.
  
      Params:
        lineSpacing = the line spacing
  */
  void setLineSpacing(int lineSpacing) nothrow
  {
    adw_wrap_box_set_line_spacing(cast(AdwWrapBox*)this._cPtr, lineSpacing);
  }

  /**
      Sets the length unit for line spacing.
      
      Allows the spacing to vary depending on the text scale factor.
      
      See [adw.wrap_box.WrapBox.lineSpacing].
  
      Params:
        unit = the length unit
  */
  void setLineSpacingUnit(adw.types.LengthUnit unit) nothrow
  {
    adw_wrap_box_set_line_spacing_unit(cast(AdwWrapBox*)this._cPtr, unit);
  }

  /**
      Sets the natural size for each line.
      
      It should be used to limit the line lengths, for example when used in
      popovers.
      
      See [adw.wrap_box.WrapBox.naturalLineLengthUnit].
  
      Params:
        naturalLineLength = the natural length
  */
  void setNaturalLineLength(int naturalLineLength) nothrow
  {
    adw_wrap_box_set_natural_line_length(cast(AdwWrapBox*)this._cPtr, naturalLineLength);
  }

  /**
      Sets the length unit for natural line length.
      
      Allows the length to vary depending on the text scale factor.
      
      See [adw.wrap_box.WrapBox.naturalLineLength].
  
      Params:
        unit = the length unit
  */
  void setNaturalLineLengthUnit(adw.types.LengthUnit unit) nothrow
  {
    adw_wrap_box_set_natural_line_length_unit(cast(AdwWrapBox*)this._cPtr, unit);
  }

  /**
      Sets the direction children are packed in each line.
  
      Params:
        packDirection = the new line direction
  */
  void setPackDirection(adw.types.PackDirection packDirection) nothrow
  {
    adw_wrap_box_set_pack_direction(cast(AdwWrapBox*)this._cPtr, packDirection);
  }

  /**
      Sets the policy for line wrapping.
      
      If set to [adw.types.WrapPolicy.Natural], the box will wrap to the next line
      as soon as the previous line cannot fit any more children without shrinking
      them past their natural size.
      
      If set to [adw.types.WrapPolicy.Minimum], the box will try to fit as many
      children into each line as possible, shrinking them down to their minimum\
      size before wrapping to the next line.
  
      Params:
        wrapPolicy = the new wrap policy
  */
  void setWrapPolicy(adw.types.WrapPolicy wrapPolicy) nothrow
  {
    adw_wrap_box_set_wrap_policy(cast(AdwWrapBox*)this._cPtr, wrapPolicy);
  }

  /**
      Sets whether wrap direction should be reversed.
      
      By default, lines wrap downwards in a horizontal box, and towards the end
      in a vertical box. If set to `TRUE`, they wrap upwards or towards the start
      respectively.
  
      Params:
        wrapReverse = whether to reverse wrap direction
  */
  void setWrapReverse(bool wrapReverse) nothrow
  {
    adw_wrap_box_set_wrap_reverse(cast(AdwWrapBox*)this._cPtr, wrapReverse);
  }
}

/// Fluent builder implementation template for [adw.wrap_box.WrapBox]
class WrapBoxGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T, gtk.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `align_` property.
      Params:
        propval = The alignment of the children within each line.
          
          0 means the children are placed at the start of the line, 1 means they are
          placed at the end of the line. 0.5 means they are placed in the middle of
          the line.
          
          Alignment is only used when [adw.wrap_box.WrapBox.justify] is set to
          [adw.types.JustifyMode.None], or on the last line when the
          [adw.wrap_box.WrapBox.justifyLastLine] is `FALSE`.
      Returns: Builder instance for fluent chaining
  */
  T align_(float propval) nothrow
  {
    return setProperty("align", propval);
  }

  /**
      Set `childSpacing` property.
      Params:
        propval = The spacing between widgets on the same line.
          
          See [adw.wrap_box.WrapBox.childSpacingUnit].
      Returns: Builder instance for fluent chaining
  */
  T childSpacing(int propval) nothrow
  {
    return setProperty("child-spacing", propval);
  }

  /**
      Set `childSpacingUnit` property.
      Params:
        propval = The length unit for child spacing.
          
          Allows the spacing to vary depending on the text scale factor.
          
          See [adw.wrap_box.WrapBox.childSpacing].
      Returns: Builder instance for fluent chaining
  */
  T childSpacingUnit(adw.types.LengthUnit propval) nothrow
  {
    return setProperty("child-spacing-unit", propval);
  }

  /**
      Set `justify` property.
      Params:
        propval = Determines whether and how each complete line should be stretched to fill
          the entire widget.
          
          If set to [adw.types.JustifyMode.Fill], each widget in the line will be
          stretched, keeping consistent spacing, so that the line fills the entire
          widget.
          
          If set to [adw.types.JustifyMode.Spread], the spacing between widgets will
          be increased, keeping widget sizes intact. The first and last widget will
          be aligned with the beginning and end of the line. If the line only
          contains a single widget, it will be stretched regardless.
          
          If set to [adw.types.JustifyMode.None], the line will not be stretched and
          the children will be placed together within the line, according to
          [adw.wrap_box.WrapBox.align_].
          
          By default this doesn't affect the last line, as it will be incomplete. Use
          [adw.wrap_box.WrapBox.justifyLastLine] to justify it as well.
      Returns: Builder instance for fluent chaining
  */
  T justify(adw.types.JustifyMode propval) nothrow
  {
    return setProperty("justify", propval);
  }

  /**
      Set `justifyLastLine` property.
      Params:
        propval = Whether the last line should be stretched to fill the entire widget.
          
          See [adw.wrap_box.WrapBox.justify].
      Returns: Builder instance for fluent chaining
  */
  T justifyLastLine(bool propval) nothrow
  {
    return setProperty("justify-last-line", propval);
  }

  /**
      Set `lineHomogeneous` property.
      Params:
        propval = Whether all lines should take the same amount of space.
      Returns: Builder instance for fluent chaining
  */
  T lineHomogeneous(bool propval) nothrow
  {
    return setProperty("line-homogeneous", propval);
  }

  /**
      Set `lineSpacing` property.
      Params:
        propval = The spacing between lines.
          
          See [adw.wrap_box.WrapBox.lineSpacingUnit].
      Returns: Builder instance for fluent chaining
  */
  T lineSpacing(int propval) nothrow
  {
    return setProperty("line-spacing", propval);
  }

  /**
      Set `lineSpacingUnit` property.
      Params:
        propval = The length unit for line spacing.
          
          Allows the spacing to vary depending on the text scale factor.
          
          See [adw.wrap_box.WrapBox.lineSpacing].
      Returns: Builder instance for fluent chaining
  */
  T lineSpacingUnit(adw.types.LengthUnit propval) nothrow
  {
    return setProperty("line-spacing-unit", propval);
  }

  /**
      Set `naturalLineLength` property.
      Params:
        propval = Determines the natural size for each line.
          
          It should be used to limit the line lengths, for example when used in
          popovers.
          
          See [adw.wrap_box.WrapBox.naturalLineLengthUnit].
      Returns: Builder instance for fluent chaining
  */
  T naturalLineLength(int propval) nothrow
  {
    return setProperty("natural-line-length", propval);
  }

  /**
      Set `naturalLineLengthUnit` property.
      Params:
        propval = The length unit for natural line length.
          
          Allows the length to vary depending on the text scale factor.
          
          See [adw.wrap_box.WrapBox.naturalLineLength].
      Returns: Builder instance for fluent chaining
  */
  T naturalLineLengthUnit(adw.types.LengthUnit propval) nothrow
  {
    return setProperty("natural-line-length-unit", propval);
  }

  /**
      Set `packDirection` property.
      Params:
        propval = The direction children are packed in each line.
      Returns: Builder instance for fluent chaining
  */
  T packDirection(adw.types.PackDirection propval) nothrow
  {
    return setProperty("pack-direction", propval);
  }

  /**
      Set `wrapPolicy` property.
      Params:
        propval = The policy for line wrapping.
          
             + If set to [adw.types.WrapPolicy.Natural], the box will wrap to the next line
          as soon as the previous line cannot fit any more children without shrinking
          them past their natural size.
          
          If set to [adw.types.WrapPolicy.Minimum], the box will try to fit as many
          children into each line as possible, shrinking them down to their minimum
          size before wrapping to the next line.
      Returns: Builder instance for fluent chaining
  */
  T wrapPolicy(adw.types.WrapPolicy propval) nothrow
  {
    return setProperty("wrap-policy", propval);
  }

  /**
      Set `wrapReverse` property.
      Params:
        propval = Whether wrap direction should be reversed.
          
          By default, lines wrap downwards in a horizontal box, and towards the end
          in a vertical box. If set to `TRUE`, they wrap upwards or towards the start
          respectively.
      Returns: Builder instance for fluent chaining
  */
  T wrapReverse(bool propval) nothrow
  {
    return setProperty("wrap-reverse", propval);
  }
}

/// Fluent builder for [adw.wrap_box.WrapBox]
final class WrapBoxGidBuilder : WrapBoxGidBuilderImpl!WrapBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WrapBox build() nothrow
  {
    return new WrapBox(cast(void*)createGObject(WrapBox._getGType), Yes.Take);
  }
}
