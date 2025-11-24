TYP_FILES := $(shell find . -name '*.typ' -not -name 'style.typ' -not -name 'report_template.typ')
PDF_FILES := $(TYP_FILES:%.typ=%.pdf)

all: $(PDF_FILES)

%.pdf: %.typ
	cd "$(dir $<)" && typst compile "$(notdir $<)"

clean:
	rm -f $(PDF_FILES)

.PHONY: all clean
