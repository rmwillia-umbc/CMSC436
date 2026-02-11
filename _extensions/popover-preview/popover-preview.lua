function popover_preview(args, kwargs, meta)
  local url = pandoc.utils.stringify(args[1])
  local width = kwargs["width"] or "350"
  local height = kwargs["height"] or "250"

  local html = string.format([[
<a href="#"
   data-bs-toggle="popover"
   data-bs-trigger="click"
   onclick="return false;"
   data-bs-boundary="viewport"
   data-bs-html="true"
   data-bs-sanitize="false"
   data-bs-content='<iframe src="%s" width="%s" height="%s" style="border:none;"></iframe>'>
  <span title="Click to preview"><i class="bi bi-eye"></i></span>
</a>]], url, width, height)

  return pandoc.RawInline('html', html)
end

return {
  ['popover-preview'] = popover_preview
}
