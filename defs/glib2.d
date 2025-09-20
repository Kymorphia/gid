//!gir GLib-2.0
//!info description "D binding for the GLib library - General purpose portable utility library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/glib.html
//!info capi https://docs.gtk.org/glib/

//# Disable binding of container types
//!set record[Array][ignore] 1
//!set record[ByteArray][ignore] 1
//!set record[PtrArray][ignore] 1
//!set record[List][ignore] 1
//!set record[SList][ignore] 1
//!set record[HashTable][ignore] 1
//!set record[HashTableIter][ignore] 1
//!set record[Tree][ignore] 1

//!set function[malloc][name] gmalloc
//!set function[free][name] gfree

//# utime function takes an undefined utimebuf pointer, just delete it
//!del function[utime]

//# Not introspectable, but could be implemented manually
//!set function[base64_encode_close][introspectable] 0
//!set function[base64_encode_step][introspectable] 0
//!set function[prefix_error_literal][introspectable] 0
//!set function[strfreev][introspectable] 0
//!set function[test_add_data_func_full][introspectable] 0
//!set function[unichar_to_utf8][introspectable] 0
//!set record[Variant].constructor[new_from_data][introspectable] 0
//!set record[Variant].function[parse][introspectable] 0

//# Disable problematic functions (memory allocation issues)
//!set record[Bytes].constructor[new_take][ignore] 1
//!set function[base64_decode_inplace][ignore] 1

//# Ignore functions which don't have proper closures
//!set function[atexit][ignore] 1
//!set function[test_add_func][ignore] 1
//!set function[test_queue_destroy][ignore] 1

//# Ignore unnecessary dup_string method (get_string does the same thing)
//!set record[Variant].method[dup_string][ignore] 1

//# Error conflicts with the base D Error type, rename to ErrorG
//!subtype Error ErrorWrap

//# Override OptionEntry type kind to be a simple struct, not Wrap
//!kind OptionEntry Simple

//# Override PollFD type kind to be a simple struct, not Boxed
//!kind PollFD Simple

//# Fix Dir by specifying g_dir_close as the free function and g_dir_open as the constructor
//!set record[Dir][free-function] g_dir_close
//!set record[Dir].method[close][ignore] 1

//# Disable binding of unuseful API
//!set record[Completion][ignore] 1
//!set record[TrashStack][ignore] 1
//!set record[LogField][ignore] 1
//!set callback[LogWriterFunc][ignore] 1
//!set function[log_set_writer_func][ignore] 1
//!set function[log_structured_array][ignore] 1
//!set function[log_writer_default][ignore] 1
//!set function[log_writer_format_fields][ignore] 1
//!set function[log_writer_journald][ignore] 1
//!set function[log_writer_standard_streams][ignore] 1
//!set function[log_writer_syslog][ignore] 1

//# Disable Queue fields
//!set record[Queue].field[head][ignore] 1
//!set record[Queue].field[tail][ignore] 1

//# Disable TestLogMsg fields
//!set record[TestLogMsg].*field[][ignore] 1

//# Disable datalist functions
//!set *function[datalist_*][ignore] 1

//# Remove problematic type
//!del union[DoubleIEEE754]

//# Remove problematic type
//!del union[FloatIEEE754]

//# Change IConv from a record to a void* alias
//!del record[IConv]
//!add repository.namespace '<alias name="IConv" c:type="GIConv"><type name="void*" c:type="void*"/></alias>'

//# IOChannel should be opaque
//!set record[IOChannel][opaque] 1

//# Set field callback parameters to out
//!set record[IOFuncs].field[io_read].callback[io_read].parameters.parameter[bytes_read][direction] out
//!set record[IOFuncs].field[io_write].callback[io_write].parameters.parameter[bytes_written][direction] out
//!set record[SourceFuncs].field[prepare].callback[prepare].parameters.parameter[timeout_][direction] out

//# FIXME - This contains a union which isn't currently supported
//!set record[VariantDict][opaque] 1

//# These arrays should have zero-terminated set
//!set record[OptionContext].method[add_main_entries].parameters.parameter[entries].array[][zero-terminated] 1
//!set record[OptionGroup].method[add_entries].parameters.parameter[entries].array[][zero-terminated] 1

//# Change arrays of chars to strings
//!set function[spawn_command_line_sync].parameters.parameter[standard_error].array '<type name="utf8" c:type="char**"/>'
//!set function[spawn_command_line_sync].parameters.parameter[standard_output].array '<type name="utf8" c:type="char**"/>'
//!set function[spawn_sync].parameters.parameter[standard_error].array '<type name="utf8" c:type="char**"/>'
//!set function[spawn_sync].parameters.parameter[standard_output].array '<type name="utf8" c:type="char**"/>'
//!set record[Variant].method[get_bytestring].return-value.array '<type name="string" c:type="const char*"/>'
//!set record[Variant].constructor[new_bytestring].parameters.parameter[string].array '<type name="string" c:type="const char*"/>'

//# Missing array argument length
//!set record[IOChannel].method[write_chars].parameters.parameter[buf].array[][length] 1

//# Add missing free functions
//!set record[AsyncQueue][free-function] g_async_queue_unref
//!set record[Hmac][free-function] g_hmac_unref
//!set record[List][free-function] g_list_free
//!set record[OptionContext][free-function] g_option_context_free
//!set record[Queue][free-function] g_queue_free
//!set record[Rand][free-function] g_rand_free
//!set record[Scanner][free-function] g_scanner_destroy
//!set record[Sequence][free-function] g_sequence_free
//!set record[SList][free-function] g_slist_free
//!set record[StringChunk][free-function] g_string_chunk_free
//!set record[StrvBuilder][free-function] g_strv_builder_unref
//!set record[TestCase][free-function] g_test_case_free
//!set record[TestSuite][free-function] g_test_suite_free
//!set record[VariantIter][free-function] g_variant_iter_free

//# Change Variant to a class, set to glib:fundamental, and add ref and unref functions
//!rename record[Variant] class
//!set class[Variant][glib:fundamental] 1
//!set class[Variant][glib:ref-func] g_variant_ref_sink
//!set class[Variant][glib:unref-func] g_variant_unref

//# Disable deprecated g_variant_parser_get_error_quark since it confuses the exception generator
//!set class[Variant].function[parser_get_error_quark][ignore] 1

//# Add ref/unref functions to VariantBuilder
//!set record[VariantBuilder][glib:ref-func] g_variant_builder_ref
//!set record[VariantBuilder][glib:unref-func] g_variant_builder_unref
//!set record[VariantBuilder].union[u][private] 1

//# Add missing parameter direction "out"
//!set record[IOChannel].method[read].parameters.parameter[bytes_read][direction] out
//!set record[IOChannel].method[read_line_string].parameters.parameter[terminator_pos][direction] out
//!set record[IOChannel].method[write].parameters.parameter[bytes_written][direction] out
//!set record[Once].function[init_enter_impl].parameters.parameter[location][direction] out

//# Fix string array parameters with lengths to be array of chars not array of strings
//!set record[Regex].method[match_all_full].parameters.parameter[string].array.type[][name] char
//!set record[Regex].method[match_full].parameters.parameter[string].array.type[][name] char
//!set record[Regex].method[replace_literal].parameters.parameter[string].array.type[][name] char
//!set record[Regex].method[replace].parameters.parameter[string].array.type[][name] char
//!set record[Regex].method[split_full].parameters.parameter[string].array.type[][name] char

//# Set proper direction of pointer parameters
//!set function[atomic_int_add].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_and].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_compare_and_exchange_full].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_compare_and_exchange].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_dec_and_test].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_exchange_and_add].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_exchange].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_get].parameters.parameter[atomic][direction] out
//!set function[atomic_int_inc].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_or].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_set].parameters.parameter[atomic][direction] inout
//!set function[atomic_int_xor].parameters.parameter[atomic][direction] inout
//!set function[atomic_ref_count_compare].parameters.parameter[arc][direction] inout
//!set function[atomic_ref_count_dec].parameters.parameter[arc][direction] inout
//!set function[atomic_ref_count_inc].parameters.parameter[arc][direction] inout
//!set function[atomic_ref_count_init].parameters.parameter[arc][direction] inout
//!set function[bit_lock].parameters.parameter[address][direction] inout
//!set function[bit_trylock].parameters.parameter[address][direction] inout
//!set function[bit_unlock].parameters.parameter[address][direction] inout
//!set function[nullify_pointer].parameters.parameter[nullify_location][direction] out
//!set function[ref_count_compare].parameters.parameter[rc][direction] inout
//!set function[ref_count_dec].parameters.parameter[rc][direction] inout
//!set function[ref_count_inc].parameters.parameter[rc][direction] inout
//!set function[ref_count_init].parameters.parameter[rc][direction] inout
//!set record[Timer].method[elapsed].parameters.parameter[microseconds][direction] out
//!set record[Completion].method[complete_utf8].parameters.parameter[new_prefix][direction] out
//!set record[Completion].method[complete_utf8].parameters.parameter[new_prefix][transfer-ownership] full

//# Fix or add missing array information
//!set function[assertion_message_cmpstrv].parameters.parameter[arg1].type '<array zero-terminated="1" c:type="const char* const*"><type name="utf8" c:type="const char*"/></array>'
//!set function[assertion_message_cmpstrv].parameters.parameter[arg2].type '<array zero-terminated="1" c:type="const char* const*"><type name="utf8" c:type="const char*"/></array>'
//!set function[log_writer_default_set_debug_domains].parameters.parameter[domains].type '<array zero-terminated="1" c:type="const char* const*"><type name="utf8" c:type="const char*"/></array>'
//!set function[slice_get_config_state].return-value.type '<array length="2" zero-terminated="0" c:type="const gint64*"><type name="gint64" c:type="gint64"/></array>'
//!set function[slice_get_config_state].parameters.parameter[n_values][direction] out
//!set function[ucs4_to_utf16].return-value.type '<array zero-terminated="1" c:type="gunichar2*"><type name="guint16" c:type="gunichar2"/></array>'
//!set function[unicode_canonical_decomposition].return-value.type '<array length="1" zero-terminated="0" c:type="gunichar*"><type name="gunichar" c:type="gunichar"/></array>'
//!set function[unicode_canonical_decomposition].parameters.parameter[result_len][direction] out
//!set function[utf16_to_ucs4].return-value.type '<array length="3" zero-terminated="1" c:type="gunichar*"><type name="gunichar" c:type="gunichar"/></array>'
//!set function[utf8_to_ucs4].return-value.type '<array length="3" zero-terminated="1" c:type="gunichar*"><type name="gunichar" c:type="gunichar"/></array>'
//!set function[utf8_to_ucs4_fast].return-value.type '<array length="2" zero-terminated="1" c:type="gunichar*"><type name="gunichar" c:type="gunichar"/></array>'
//!set function[utf8_to_ucs4_fast].parameters.parameter[str].type '<array length="1" zero-terminated="1" c:type="const gchar*"><type name="gchar" c:type="gchar"/></array>'
//!set function[utf8_to_utf16].return-value.type '<array length="3" zero-terminated="1" c:type="gunichar2*"><type name="guint16" c:type="gunichar2"/></array>'
//!set record[Hmac].method[get_digest].parameters.parameter[buffer][direction] out
//!set record[Hmac].method[get_digest].parameters.parameter[buffer][caller-allocates] 1
//!set record[IOChannel].method[read].parameters.parameter[buf].type '<array length="1" zero-terminated="0" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[IOChannel].method[read].parameters.parameter[buf][caller-allocates] 1
//!set record[IOChannel].method[read].parameters.parameter[buf][direction] out
//!set record[Rand].method[set_seed_array].parameters.parameter[seed].type '<array length="1" zero-terminated="0" c:type="const guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[Rand].constructor[new_with_seed_array].parameters.parameter[seed].type '<array length="1" zero-terminated="0" c:type="const guint32*"><type name="guint32" c:type="guint32"/></array>'
//!set record[TestLogBuffer].method[push].parameters.parameter[bytes].type '<array length="0" zero-terminated="0" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[StrvBuilder].method[end].return-value.array '<array zero-terminated="1" c:type="char**"><type name="utf8" c:type="char*"/></array>'

//# Use array of characters with a length, to remove the length and optimize
//!set record[IOChannel].method[set_line_term].parameters.parameter[line_term].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[Regex].function[escape_nul].parameters.parameter[string].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[Regex].function[escape_string].parameters.parameter[string].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[KeyFile].method[get_keys].return-value.array[][length] 1
//!set record[KeyFile].method[get_groups].return-value.array[][length] 0
//!set record[KeyFile].method[to_data].return-value.type '<array length="0" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set function[filename_from_utf8].return-value.type '<array length="3" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[filename_from_utf8].parameters.parameter[utf8string].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[filename_to_utf8].return-value.type '<array length="3" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set function[filename_to_utf8].parameters.parameter[opsysstring].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[locale_from_utf8].parameters.parameter[utf8string].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[locale_to_utf8].return-value.type '<array length="3" c:type="gchar*"><type name="char" c:type="char"/></array>'

//# Set writable to false as it should be
//!set record[Node].field[children][writable] 0
//!set record[Node].field[next][writable] 0
//!set record[Node].field[parent][writable] 0
//!set record[Node].field[prev][writable] 0
//!set record[Scanner].field[config][writable] 0
//!set record[Scanner].field[next_value][writable] 0
//!set record[Scanner].field[value][writable] 0

//# Add missing closure parameter designations
//!set callback[IOFunc].parameters.parameter[data][closure] 2
//!set callback[SpawnChildSetupFunc].parameters.parameter[data][closure] 0
//!set callback[ThreadFunc].parameters.parameter[data][closure] 0
//!set callback[TranslateFunc].parameters.parameter[data][closure] 1

//# Set proper callback scopes
//!set record[Queue].method[clear_full].parameters.parameter[free_func][scope] call
//!set record[Queue].method[free_full].parameters.parameter[free_func][scope] call
//!set function[atomic_rc_box_release_full].parameters.parameter[clear_func][scope] call
//!set function[rc_box_release_full].parameters.parameter[clear_func][scope] call

//# Change Variant.getString() return type to an array of chars with a length to remove length param and optimize
//!set class[Variant].method[get_string].return-value.type '<array length="0" c:type="gchar*"><type name="char" c:type="char"/></array>'

//# g_markup_parse_context_new() has unnecessary closure and destroy notify, override the new() method
//!set record[MarkupParseContext].constructor[new][ignore] 1
//!class MarkupParseContext

  /** */
  this(ref MarkupParser parser, MarkupParseFlags flags)
  {
    GMarkupParseContext* _cretval;
    GMarkupParseFlags _flags = cast(GMarkupParseFlags)cast(uint)flags;
    _cretval = g_markup_parse_context_new(&parser, _flags, null, null);
    this(_cretval, Yes.Take);
  }

//# g_option_group_new() has unnecessary closure and destroy notify, override the new() method
//!set record[OptionGroup].constructor[new][ignore] 1
//!class OptionGroup

  /** */
  this(string name, string description, string helpDescription)
  {
    GOptionGroup* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _description = description.toCString(No.Alloc);
    const(char)* _helpDescription = helpDescription.toCString(No.Alloc);
    _cretval = g_option_group_new(_name, _description, _helpDescription, null, null);
    this(_cretval, Yes.Take);
  }

//# Use a custom free function since g_thread_pool_free takes 3 arguments
//!set record[ThreadPool][free-function] freePool
//!class ThreadPool

  private static void freePool(GThreadPool* pool)
  {
    g_thread_pool_free(pool, true, false); // immediate, wait
  }

//# Change Timer.new() function to a constructor and set to inspectable
//!set record[Timer].function[new][introspectable] 1
//!rename record[Timer].function[new] constructor

//# Add Timer.elapsed() without uselss microseconds parameter
//!class Timer

  /**
   * If timer has been started but not stopped, obtains the time since
   * the timer was started. If timer has been stopped, obtains the
   * elapsed time between the time it was started and the time it was
   * stopped. The return value is the number of seconds elapsed,
   * including any fractional part.
   * Returns: seconds elapsed as a floating point value, including any
   *   fractional part.
   */
  double elapsed()
  {
    double _retval;
    _retval = g_timer_elapsed(cast(GTimer*)_cPtr, null);
    return _retval;
  }

//!set record[Date].function[strftime][disable] 1
//!class Date

  /**
      Generates a printed representation of the date, in a
      [locale][setlocale]-specific way.
      Works just like the platform's C library strftime() function,
      but only accepts date-related formats; time-related formats
      give undefined results. Date must be valid. Unlike strftime()
      (which uses the locale encoding), works on a UTF-8 format
      string and stores a UTF-8 result.
      
      This function does not provide any conversion specifiers in
      addition to those implemented by the platform's C library.
      For example, don't expect that using [glib.date.Date.strftime] would
      make the \`F` provided by the C99 strftime() work on Windows
      where the C library only complies to C89.
  
      Params:
        format = format string
      Returns: The formatted date string, will be empty if result exceeds 1024 bytes
   */
  string strftime(string format)
  {
    char[] buf;
    const(char)* _format = format.toCString(No.Alloc);

    for (buf.length = 32; buf.length <= 1024; buf.length *= 2) // Increase buffer until output fits
    {
      auto sizeWritten = g_date_strftime(buf.ptr, buf.length, _format, cast(const(GDate)*)_cPtr(No.Dup));

      if (sizeWritten > 0)
      {
        buf.length = sizeWritten;
        return cast(string)buf;
      }
    }

    return null;
  }
