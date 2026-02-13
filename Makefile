designs = $(shell find * -maxdepth 0 -type d)
TAG ?= user_project_run
PROJECT_DIR = $(pwd)
current_design = null
intances= PLL
top_module = user_project

PDK_ROOT = $(PROJECT_DIR)/IHP-Open-PDK
PDK=ihp-sg13g2

list:
	@echo $(designs)

ifeq ($(VIEW_RESULTS),1)
.PHONY: $(designs)
$(designs): export current_design=$@
$(designs):
	# View the results in KLayout
	PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --last-run --manual-pdk $(current_design)/config.json --flow OpenInOpenROAD

else 
.PHONY: $(designs)
$(designs): export current_design=$@
$(designs):
	# Run librelane to generate the layout
	PDK_ROOT=$(PDK_ROOT) PDK=$(PDK) librelane --run-tag $(TAG) --overwrite --manual-pdk $(current_design)/config.json
	# copy final results to top directory
	rm -rf $(current_design)/final
	cp -r $(current_design)/runs/$(TAG)/final $(current_design)/final 
endif

mv:
	rm /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/$(top_module).nl.v
	rm /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/$(top_module)__nom_fast_1p32V_m40C.sdf
	rm /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/$(top_module)__nom_slow_1p08V_125C.sdf
	rm /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/$(top_module)__nom_typ_1p20V_25C.sdf
	cp /home/userdata/k68D/chienpv_68d/Desktop/uniccass-icdesign-tools/shared_xserver/unic-cass-wrapper/unic_cass_wrapper_user_project/$(intances)/final/nl/$(top_module).nl.v /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/
	cp /home/userdata/k68D/chienpv_68d/Desktop/uniccass-icdesign-tools/shared_xserver/unic-cass-wrapper/unic_cass_wrapper_user_project/$(intances)/final/sdf/nom_fast_1p32V_m40C/$(top_module)__nom_fast_1p32V_m40C.sdf /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/
	cp /home/userdata/k68D/chienpv_68d/Desktop/uniccass-icdesign-tools/shared_xserver/unic-cass-wrapper/unic_cass_wrapper_user_project/$(intances)/final/sdf/nom_slow_1p08V_125C/$(top_module)__nom_slow_1p08V_125C.sdf /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/
	cp /home/userdata/k68D/chienpv_68d/Desktop/uniccass-icdesign-tools/shared_xserver/unic-cass-wrapper/unic_cass_wrapper_user_project/$(intances)/final/sdf/nom_typ_1p20V_25C/$(top_module)__nom_typ_1p20V_25C.sdf /home/userdata/k68D/chienpv_68d/Desktop/sdf/$(intances)/
