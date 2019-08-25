module CitationHelper
    def citation_btn_for(item)
        CitationButton.new(self, item).html
    end

    class CitationButton
        def initialize(view, item)
            @view, @item = view, item
        end

        def html
            # anchor element with classes: waves-effect waves-light btn modal-trigger and href: #cite-modal
            # div with id: #cite-modal and class modal
                # MLA
                    # textarea with id: randomID
                    # anchor to copy with onclick: copyMla(id) and classes: waves-effect waves-light btn-small

            content_tag(:div, safe_join([anchor, modal]))
        end

        private

        attr_accessor :view, :item
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def anchor
            content_tag(:a, "Cite This Item", class: "waves-effect waves-light btn modal-trigger", href: "#citation-modal-#{item.id}")
        end

        def modal
            citations_content = content_tag(:div, safe_join([mla]))
            modal_header = content_tag(:h1, "CITE THIS ITEM")
            modal_content = content_tag(:div, safe_join([modal_header, citations_content]), class: "modal-content")
            content_tag(:div, modal_content, id: "citation-modal-#{item.id}", class: "modal")
        end

        def mla
            textarea_id = SecureRandom.hex(6).to_s
            textarea = content_tag(:textarea,
                 "#{item.author}, #{item.title}. #{item.publisher.name}, #{item.year}, IACAROS",
                  class: "citation",
                    id: textarea_id)
            copy = content_tag(:a, "COPY", class: "waves-effect waves-light btn-small", onclick: "copyCitation('#{textarea_id}')")
            content_tag(:div, safe_join([textarea, copy]),class: "citation-container")
        end

    end
end