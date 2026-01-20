/// Module for [Inscription] class
module gtk.inscription;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_text;
import gtk.accessible_text_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;
import pango.attr_list;
import pango.types;

/**
    [gtk.inscription.Inscription] is a widget to show text in a predefined area.
    
    You likely want to use [gtk.label.Label] instead as this widget is intended only
    for a small subset of use cases. The main scenario envisaged is inside lists
    such as [gtk.column_view.ColumnView].
    
    While a [gtk.label.Label] sizes itself depending on the text that is displayed,
    [gtk.inscription.Inscription] is given a size and inscribes the given text into that
    space as well as it can.
    
    Users of this widget should take care to plan behaviour for the common case
    where the text doesn't fit exactly in the allocated space.
*/
class Inscription : gtk.widget.Widget, gtk.accessible_text.AccessibleText
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
    return cast(void function())gtk_inscription_get_type != &gidSymbolNotFound ? gtk_inscription_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Inscription self()
  {
    return this;
  }

  /**
      Get `attributes` property.
      Returns: A list of style attributes to apply to the text of the inscription.
  */
  @property pango.attr_list.AttrList attributes()
  {
    return getAttributes();
  }

  /**
      Set `attributes` property.
      Params:
        propval = A list of style attributes to apply to the text of the inscription.
  */
  @property void attributes(pango.attr_list.AttrList propval)
  {
    return setAttributes(propval);
  }

  /**
      Set `markup` property.
      Params:
        propval = Utility property that sets both the [gtk.inscription.Inscription.text] and
          [gtk.inscription.Inscription.attributes] properties, mainly intended for use in
          GtkBuilder ui files to ease translation support and bindings.
          
          This function uses `func@Pango.parse_markup` to parse the markup into text and
          attributes. The markup must be valid. If you cannot ensure that, consider using
          `func@Pango.parse_markup` and setting the two properties yourself.
  */
  @property void markup(string propval)
  {
    return setMarkup(propval);
  }

  /**
      Get `minChars` property.
      Returns: The number of characters that should fit into the inscription at minimum.
        
        This influences the requested width, not the width actually given to the widget,
        which might turn out to be larger.
        
        Note that this is an approximate character width, so some characters might be
        wider and some might be thinner, so do not expect the number of characters to
        exactly match.
        
        If you set this property to 0, the inscription will not request any width at all
        and its width will be determined entirely by its surroundings.
  */
  @property uint minChars()
  {
    return getMinChars();
  }

  /**
      Set `minChars` property.
      Params:
        propval = The number of characters that should fit into the inscription at minimum.
          
          This influences the requested width, not the width actually given to the widget,
          which might turn out to be larger.
          
          Note that this is an approximate character width, so some characters might be
          wider and some might be thinner, so do not expect the number of characters to
          exactly match.
          
          If you set this property to 0, the inscription will not request any width at all
          and its width will be determined entirely by its surroundings.
  */
  @property void minChars(uint propval)
  {
    return setMinChars(propval);
  }

  /**
      Get `minLines` property.
      Returns: The number of lines that should fit into the inscription at minimum.
        
        This influences the requested height, not the height actually given to the widget,
        which might turn out to be larger.
        
        Note that this is an approximate line height, so if the text uses things like fancy
        Unicode or attribute that influence the height, the text might not fit.
        
        If you set this property to 0, the inscription will not request any height at all
        and its height will be determined entirely by its surroundings.
  */
  @property uint minLines()
  {
    return getMinLines();
  }

  /**
      Set `minLines` property.
      Params:
        propval = The number of lines that should fit into the inscription at minimum.
          
          This influences the requested height, not the height actually given to the widget,
          which might turn out to be larger.
          
          Note that this is an approximate line height, so if the text uses things like fancy
          Unicode or attribute that influence the height, the text might not fit.
          
          If you set this property to 0, the inscription will not request any height at all
          and its height will be determined entirely by its surroundings.
  */
  @property void minLines(uint propval)
  {
    return setMinLines(propval);
  }

  /**
      Get `natChars` property.
      Returns: The number of characters that should ideally fit into the inscription.
        
        This influences the requested width, not the width actually given to the widget.
        The widget might turn out larger as well as smaller.
        
        If this property is set to a value smaller than `property@Gtk.Inscription:min-chars`,
        that value will be used. In particular, for the default value of 0, this will always
        be the case.
  */
  @property uint natChars()
  {
    return getNatChars();
  }

  /**
      Set `natChars` property.
      Params:
        propval = The number of characters that should ideally fit into the inscription.
          
          This influences the requested width, not the width actually given to the widget.
          The widget might turn out larger as well as smaller.
          
          If this property is set to a value smaller than `property@Gtk.Inscription:min-chars`,
          that value will be used. In particular, for the default value of 0, this will always
          be the case.
  */
  @property void natChars(uint propval)
  {
    return setNatChars(propval);
  }

  /**
      Get `natLines` property.
      Returns: The number of lines that should ideally fit into the inscription.
        
        This influences the requested height, not the height actually given to the widget.
        The widget might turn out larger as well as smaller.
        
        If this property is set to a value smaller than `property@Gtk.Inscription:min-lines`,
        that value will be used. In particular, for the default value of 0, this will always
        be the case.
  */
  @property uint natLines()
  {
    return getNatLines();
  }

  /**
      Set `natLines` property.
      Params:
        propval = The number of lines that should ideally fit into the inscription.
          
          This influences the requested height, not the height actually given to the widget.
          The widget might turn out larger as well as smaller.
          
          If this property is set to a value smaller than `property@Gtk.Inscription:min-lines`,
          that value will be used. In particular, for the default value of 0, this will always
          be the case.
  */
  @property void natLines(uint propval)
  {
    return setNatLines(propval);
  }

  /**
      Get `text` property.
      Returns: The displayed text.
  */
  @property string text()
  {
    return getText();
  }

  /**
      Set `text` property.
      Params:
        propval = The displayed text.
  */
  @property void text(string propval)
  {
    return setText(propval);
  }

  /**
      Get `textOverflow` property.
      Returns: The overflow method to use for the text.
  */
  @property gtk.types.InscriptionOverflow textOverflow()
  {
    return getTextOverflow();
  }

  /**
      Set `textOverflow` property.
      Params:
        propval = The overflow method to use for the text.
  */
  @property void textOverflow(gtk.types.InscriptionOverflow propval)
  {
    return setTextOverflow(propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Controls how the line wrapping is done.
        
        Note that unlike [gtk.label.Label], the default here is [pango.types.WrapMode.WordChar].
  */
  @property pango.types.WrapMode wrapMode()
  {
    return getWrapMode();
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Controls how the line wrapping is done.
          
          Note that unlike [gtk.label.Label], the default here is [pango.types.WrapMode.WordChar].
  */
  @property void wrapMode(pango.types.WrapMode propval)
  {
    return setWrapMode(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of the text inside the allocated size.
        
        Compare this to [gtk.widget.Widget.halign], which determines how the
        inscription's size allocation is positioned in the available space.
  */
  @property float xalign()
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of the text inside the allocated size.
          
          Compare this to [gtk.widget.Widget.halign], which determines how the
          inscription's size allocation is positioned in the available space.
  */
  @property void xalign(float propval)
  {
    return setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of the text inside the allocated size.
        
        Compare this to [gtk.widget.Widget.valign], which determines how the
        inscription's size allocation is positioned in the available space.
  */
  @property float yalign()
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of the text inside the allocated size.
          
          Compare this to [gtk.widget.Widget.valign], which determines how the
          inscription's size allocation is positioned in the available space.
  */
  @property void yalign(float propval)
  {
    return setYalign(propval);
  }

  mixin AccessibleTextT!();

  /**
      Creates a new [gtk.inscription.Inscription] with the given text.
  
      Params:
        text = The text to display.
      Returns: a new [gtk.inscription.Inscription]
  */
  this(string text = null)
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = gtk_inscription_new(_text);
    this(_cretval, No.Take);
  }

  /**
      Gets the inscription's attribute list.
      Returns: the attribute list
  */
  pango.attr_list.AttrList getAttributes()
  {
    PangoAttrList* _cretval;
    _cretval = gtk_inscription_get_attributes(cast(GtkInscription*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_list.AttrList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the `min-chars` of the inscription.
      
      See the `propertyGtk.Inscription:min-chars` property.
      Returns: the min-chars property
  */
  uint getMinChars()
  {
    uint _retval;
    _retval = gtk_inscription_get_min_chars(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `min-lines` of the inscription.
      
      See the `propertyGtk.Inscription:min-lines` property.
      Returns: the min-lines property
  */
  uint getMinLines()
  {
    uint _retval;
    _retval = gtk_inscription_get_min_lines(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `nat-chars` of the inscription.
      
      See the `propertyGtk.Inscription:nat-chars` property.
      Returns: the nat-chars property
  */
  uint getNatChars()
  {
    uint _retval;
    _retval = gtk_inscription_get_nat_chars(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `nat-lines` of the inscription.
      
      See the `propertyGtk.Inscription:nat-lines` property.
      Returns: the nat-lines property
  */
  uint getNatLines()
  {
    uint _retval;
    _retval = gtk_inscription_get_nat_lines(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the text that is displayed.
      Returns: The displayed text
  */
  string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_inscription_get_text(cast(GtkInscription*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the inscription's overflow method.
      Returns: the overflow method
  */
  gtk.types.InscriptionOverflow getTextOverflow()
  {
    GtkInscriptionOverflow _cretval;
    _cretval = gtk_inscription_get_text_overflow(cast(GtkInscription*)this._cPtr);
    gtk.types.InscriptionOverflow _retval = cast(gtk.types.InscriptionOverflow)_cretval;
    return _retval;
  }

  /**
      Returns line wrap mode used by the inscription.
      
      See [gtk.inscription.Inscription.setWrapMode].
      Returns: the line wrap mode
  */
  pango.types.WrapMode getWrapMode()
  {
    PangoWrapMode _cretval;
    _cretval = gtk_inscription_get_wrap_mode(cast(GtkInscription*)this._cPtr);
    pango.types.WrapMode _retval = cast(pango.types.WrapMode)_cretval;
    return _retval;
  }

  /**
      Gets the `xalign` of the inscription.
      
      See the [gtk.inscription.Inscription.xalign] property.
      Returns: the xalign property
  */
  float getXalign()
  {
    float _retval;
    _retval = gtk_inscription_get_xalign(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Gets the `yalign` of the inscription.
      
      See the [gtk.inscription.Inscription.yalign] property.
      Returns: the yalign property
  */
  float getYalign()
  {
    float _retval;
    _retval = gtk_inscription_get_yalign(cast(GtkInscription*)this._cPtr);
    return _retval;
  }

  /**
      Apply attributes to the inscription text.
      
      These attributes will not be evaluated for sizing the inscription.
  
      Params:
        attrs = a [pango.attr_list.AttrList]
  */
  void setAttributes(pango.attr_list.AttrList attrs = null)
  {
    gtk_inscription_set_attributes(cast(GtkInscription*)this._cPtr, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /**
      Utility function to set the text and attributes to be displayed.
      
      See the [gtk.inscription.Inscription.markup] property.
  
      Params:
        markup = The markup to display
  */
  void setMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_inscription_set_markup(cast(GtkInscription*)this._cPtr, _markup);
  }

  /**
      Sets the `min-chars` of the inscription.
      
      See the `propertyGtk.Inscription:min-chars` property.
  
      Params:
        minChars = the minimum number of characters that should fit, approximately
  */
  void setMinChars(uint minChars)
  {
    gtk_inscription_set_min_chars(cast(GtkInscription*)this._cPtr, minChars);
  }

  /**
      Sets the `min-lines` of the inscription.
      
      See the `propertyGtk.Inscription:min-lines` property.
  
      Params:
        minLines = the minimum number of lines that should fit, approximately
  */
  void setMinLines(uint minLines)
  {
    gtk_inscription_set_min_lines(cast(GtkInscription*)this._cPtr, minLines);
  }

  /**
      Sets the `nat-chars` of the inscription.
      
      See the `propertyGtk.Inscription:nat-chars` property.
  
      Params:
        natChars = the number of characters that should ideally fit, approximately
  */
  void setNatChars(uint natChars)
  {
    gtk_inscription_set_nat_chars(cast(GtkInscription*)this._cPtr, natChars);
  }

  /**
      Sets the `nat-lines` of the inscription.
      
      See the `propertyGtk.Inscription:nat-lines` property.
  
      Params:
        natLines = the number of lines that should ideally fit
  */
  void setNatLines(uint natLines)
  {
    gtk_inscription_set_nat_lines(cast(GtkInscription*)this._cPtr, natLines);
  }

  /**
      Sets the text to be displayed.
  
      Params:
        text = The text to display
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_inscription_set_text(cast(GtkInscription*)this._cPtr, _text);
  }

  /**
      Sets what to do when the text doesn't fit.
  
      Params:
        overflow = the overflow method to use
  */
  void setTextOverflow(gtk.types.InscriptionOverflow overflow)
  {
    gtk_inscription_set_text_overflow(cast(GtkInscription*)this._cPtr, overflow);
  }

  /**
      Controls how line wrapping is done.
  
      Params:
        wrapMode = the line wrapping mode
  */
  void setWrapMode(pango.types.WrapMode wrapMode)
  {
    gtk_inscription_set_wrap_mode(cast(GtkInscription*)this._cPtr, wrapMode);
  }

  /**
      Sets the `xalign` of the inscription.
      
      See the [gtk.inscription.Inscription.xalign] property.
  
      Params:
        xalign = the new xalign value, between 0 and 1
  */
  void setXalign(float xalign)
  {
    gtk_inscription_set_xalign(cast(GtkInscription*)this._cPtr, xalign);
  }

  /**
      Sets the `yalign` of the inscription.
      
      See the [gtk.inscription.Inscription.yalign] property.
  
      Params:
        yalign = the new yalign value, between 0 and 1
  */
  void setYalign(float yalign)
  {
    gtk_inscription_set_yalign(cast(GtkInscription*)this._cPtr, yalign);
  }
}
