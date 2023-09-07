VERSION ?= 2.0
DOC_ID ?= 4b16acb7-af55-4ce4-819d-c0aefb99073c
URL ?= https://raw.githubusercontent.com/numinit/5etools-mc2/master/homebrew.json

define JQ_DIST_CMD
((.async.HOMEBREW_2_STORAGE | .[] | select(.head.docIdLocal == $$docIdLocal) | .head) *= {url: $$url, filename: ($$url | split("/") | last), isLocal: false, isEditable: false})
	| ((.async.HOMEBREW_2_STORAGE | .[] | select(.head.docIdLocal == $$docIdLocal) | .body._meta.sources | .[] | select(.json == $$abbreviation)) *= {full: $$name})
	| ((.sync.HOMEBREW_2_STORAGE_METAS | .[] | select(.docIdLocal == $$docIdLocal) | ._meta.sources | .[] | select(.json == $$abbreviation)) *= {full: $$name})
endef

define JQ_HOMEBREW_CMD
.async.HOMEBREW_2_STORAGE | .[] | select(.head.docIdLocal == $$docIdLocal) | .body
endef

export JQ_DIST_CMD
export JQ_HOMEBREW_CMD

all: 5etools.json homebrew.json

5etools.json: state.json
	cat $^ | jq --arg abbreviation MEAD --arg docIdLocal $(DOC_ID) --arg url $(URL) \
		--arg name "Meadiocrity Homebrew v$(VERSION) ($(shell date +%Y-%m-%d))" "$$JQ_DIST_CMD" > $@

homebrew.json: 5etools.json
	cat $^ | jq --arg docIdLocal $(DOC_ID) "$$JQ_HOMEBREW_CMD" > $@

.PHONY: all 5etools.json homebrew.json
