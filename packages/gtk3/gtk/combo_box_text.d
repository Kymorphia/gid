module gtk.combo_box_text;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.combo_box;
import gtk.container;
import gtk.types;
import gtk.widget;

/**
    A GtkComboBoxText is a simple variant of #GtkComboBox that hides
  the model-view complexity for simple text-only use cases.
  
  To create a GtkComboBoxText, use [gtk.combo_box_text.ComboBoxText.new_] or
  [gtk.combo_box_text.ComboBoxText.newWithEntry].
  
  You can add items to a GtkComboBoxText with
  [gtk.combo_box_text.ComboBoxText.appendText], [gtk.combo_box_text.ComboBoxText.insertText]
  or [gtk.combo_box_text.ComboBoxText.prependText] and remove options with
  [gtk.combo_box_text.ComboBoxText.remove].
  
  If the GtkComboBoxText contains an entry (via the “has-entry” property),
  its contents can be retrieved using [gtk.combo_box_text.ComboBoxText.getActiveText].
  The entry itself can be accessed by calling [gtk.bin.Bin.getChild] on the
  combo box.
  
  You should not call [gtk.combo_box.ComboBox.setModel] or attempt to pack more cells
  into this combo box via its GtkCellLayout interface.
  
  # GtkComboBoxText as GtkBuildable
  
  The GtkComboBoxText implementation of the GtkBuildable interface supports
  adding items directly using the `<items>` element and specifying `<item>`
  elements for each item. Each `<item>` element can specify the “id”
  corresponding to the appended text and also supports the regular
  translation attributes “translatable”, “context” and “comments”.
  
  Here is a UI definition fragment specifying GtkComboBoxText items:
  
  ```xml
  <object class="GtkComboBoxText">
    <items>
      <item translatable="yes" id="factory">Factory</item>
      <item translatable="yes" id="home">Home</item>
      <item translatable="yes" id="subway">Subway</item>
    </items>
  </object>
  ```
  
  # CSS nodes
  
  ```plain
  combobox
  ╰── box.linked
      ├── entry.combo
      ├── button.combo
      ╰── window.popup
  ```
  
  GtkComboBoxText has a single CSS node with name combobox. It adds
  the style class .combo to the main CSS nodes of its entry and button
  children, and the .linked class to the node of its internal box.
*/
class ComboBoxText : gtk.combo_box.ComboBox
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_combo_box_text_get_type != &gidSymbolNotFound ? gtk_combo_box_text_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ComboBoxText self()
  {
    return this;
  }

  /**
      Creates a new #GtkComboBoxText, which is a #GtkComboBox just displaying
    strings.
    Returns:     A new #GtkComboBoxText
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_text_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkComboBoxText, which is a #GtkComboBox just displaying
    strings. The combo box created by this function has an entry.
    Returns:     a new #GtkComboBoxText
  */
  static gtk.combo_box_text.ComboBoxText newWithEntry()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_text_new_with_entry();
    auto _retval = ObjectG.getDObject!(gtk.combo_box_text.ComboBoxText)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Appends text to the list of strings stored in combo_box.
    If id is non-null then it is used as the ID of the row.
    
    This is the same as calling [gtk.combo_box_text.ComboBoxText.insert] with a
    position of -1.
    Params:
      id =       a string ID for this value, or null
      text =       A string
  */
  void append(string id, string text)
  {
    const(char)* _id = id.toCString(No.Alloc);
    const(char)* _text = text.toCString(No.Alloc);
    gtk_combo_box_text_append(cast(GtkComboBoxText*)cPtr, _id, _text);
  }

  /**
      Appends text to the list of strings stored in combo_box.
    
    This is the same as calling [gtk.combo_box_text.ComboBoxText.insertText] with a
    position of -1.
    Params:
      text =       A string
  */
  void appendText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_combo_box_text_append_text(cast(GtkComboBoxText*)cPtr, _text);
  }

  /**
      Returns the currently active string in combo_box, or null
    if none is selected. If combo_box contains an entry, this
    function will return its contents (which will not necessarily
    be an item from the list).
    Returns:     a newly allocated string containing the
          currently active text. Must be freed with [glib.global.gfree].
  */
  string getActiveText()
  {
    char* _cretval;
    _cretval = gtk_combo_box_text_get_active_text(cast(GtkComboBoxText*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Inserts text at position in the list of strings stored in combo_box.
    If id is non-null then it is used as the ID of the row.  See
    #GtkComboBox:id-column.
    
    If position is negative then text is appended.
    Params:
      position =       An index to insert text
      id =       a string ID for this value, or null
      text =       A string to display
  */
  void insert(int position, string id, string text)
  {
    const(char)* _id = id.toCString(No.Alloc);
    const(char)* _text = text.toCString(No.Alloc);
    gtk_combo_box_text_insert(cast(GtkComboBoxText*)cPtr, position, _id, _text);
  }

  /**
      Inserts text at position in the list of strings stored in combo_box.
    
    If position is negative then text is appended.
    
    This is the same as calling [gtk.combo_box_text.ComboBoxText.insert] with a null
    ID string.
    Params:
      position =       An index to insert text
      text =       A string
  */
  void insertText(int position, string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_combo_box_text_insert_text(cast(GtkComboBoxText*)cPtr, position, _text);
  }

  /**
      Prepends text to the list of strings stored in combo_box.
    If id is non-null then it is used as the ID of the row.
    
    This is the same as calling [gtk.combo_box_text.ComboBoxText.insert] with a
    position of 0.
    Params:
      id =       a string ID for this value, or null
      text =       a string
  */
  void prepend(string id, string text)
  {
    const(char)* _id = id.toCString(No.Alloc);
    const(char)* _text = text.toCString(No.Alloc);
    gtk_combo_box_text_prepend(cast(GtkComboBoxText*)cPtr, _id, _text);
  }

  /**
      Prepends text to the list of strings stored in combo_box.
    
    This is the same as calling [gtk.combo_box_text.ComboBoxText.insertText] with a
    position of 0.
    Params:
      text =       A string
  */
  void prependText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_combo_box_text_prepend_text(cast(GtkComboBoxText*)cPtr, _text);
  }

  alias remove = gtk.container.Container.remove;

  /**
      Removes the string at position from combo_box.
    Params:
      position =       Index of the item to remove
  */
  void remove(int position)
  {
    gtk_combo_box_text_remove(cast(GtkComboBoxText*)cPtr, position);
  }

  /**
      Removes all the text entries from the combo box.
  */
  void removeAll()
  {
    gtk_combo_box_text_remove_all(cast(GtkComboBoxText*)cPtr);
  }
}
