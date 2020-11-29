################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/config-store/model/attribute-default-iterator.cc \
../forbackup/src/config-store/model/attribute-iterator.cc \
../forbackup/src/config-store/model/config-store.cc \
../forbackup/src/config-store/model/display-functions.cc \
../forbackup/src/config-store/model/file-config.cc \
../forbackup/src/config-store/model/gtk-config-store.cc \
../forbackup/src/config-store/model/model-node-creator.cc \
../forbackup/src/config-store/model/model-typeid-creator.cc \
../forbackup/src/config-store/model/raw-text-config.cc \
../forbackup/src/config-store/model/xml-config.cc 

CC_DEPS += \
./forbackup/src/config-store/model/attribute-default-iterator.d \
./forbackup/src/config-store/model/attribute-iterator.d \
./forbackup/src/config-store/model/config-store.d \
./forbackup/src/config-store/model/display-functions.d \
./forbackup/src/config-store/model/file-config.d \
./forbackup/src/config-store/model/gtk-config-store.d \
./forbackup/src/config-store/model/model-node-creator.d \
./forbackup/src/config-store/model/model-typeid-creator.d \
./forbackup/src/config-store/model/raw-text-config.d \
./forbackup/src/config-store/model/xml-config.d 

OBJS += \
./forbackup/src/config-store/model/attribute-default-iterator.o \
./forbackup/src/config-store/model/attribute-iterator.o \
./forbackup/src/config-store/model/config-store.o \
./forbackup/src/config-store/model/display-functions.o \
./forbackup/src/config-store/model/file-config.o \
./forbackup/src/config-store/model/gtk-config-store.o \
./forbackup/src/config-store/model/model-node-creator.o \
./forbackup/src/config-store/model/model-typeid-creator.o \
./forbackup/src/config-store/model/raw-text-config.o \
./forbackup/src/config-store/model/xml-config.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/config-store/model/%.o: ../forbackup/src/config-store/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


