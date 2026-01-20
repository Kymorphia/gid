/// Module for [SectionModel] interface
module gtk.section_model;

public import gtk.section_model_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.section_model.SectionModel] is an interface that adds support for sections to list models.
    
    A [gtk.section_model.SectionModel] groups successive items into so-called sections. List widgets
    like [gtk.list_view.ListView] and [gtk.grid_view.GridView] then allow displaying section headers for
    these sections by installing a header factory.
    
    Many GTK list models support sections inherently, or they pass through the sections
    of a model they are wrapping.
    
    When the section groupings of a model change, the model will emit the
    `signal@Gtk.SectionModel::sections-changed` signal by calling the
    [gtk.section_model.SectionModel.sectionsChanged] function. All sections in the given range
    then need to be queried again.
    The `signal@Gio.ListModel::items-changed` signal has the same effect, all sections in
    that range are invalidated, too.
*/
interface SectionModel
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_section_model_get_type != &gidSymbolNotFound ? gtk_section_model_get_type() : cast(GType)0;
  }

  /**
      Query the section that covers the given position. The number of
      items in the section can be computed by `out_end - out_start`.
      
      If the position is larger than the number of items, a single
      range from n_items to G_MAXUINT will be returned.
  
      Params:
        position = the position of the item to query
        outStart = the position of the first item in the section
        outEnd = the position of the first item not part of the section
            anymore.
  */
  void getSection(uint position, out uint outStart, out uint outEnd);

  /** */
  void sectionsChanged(uint position, uint nItems);

  /**
      Connect to `SectionsChanged` signal.
  
      Emitted when the start-of-section state of some of the items in model changes.
        
        Note that this signal does not specify the new section state of the
        items, they need to be queried manually. It is also not necessary for
        a model to change the section state of any of the items in the section
        model, though it would be rather useless to emit such a signal.
        
        The `signalGio.ListModel::items-changed` implies the effect of the
        `signalGtk.SectionModel::sections-changed` signal for all the items
        it covers.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, uint nItems, gtk.section_model.SectionModel sectionModel))
  
          `position` The first item that may have changed (optional)
  
          `nItems` number of items with changes (optional)
  
          `sectionModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSectionsChanged(T)(T callback, Flag!"After" after = No.After);
}
