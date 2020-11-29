################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/antenna/model/angles.cc \
../forbackup/src/antenna/model/antenna-model.cc \
../forbackup/src/antenna/model/cosine-antenna-model.cc \
../forbackup/src/antenna/model/isotropic-antenna-model.cc \
../forbackup/src/antenna/model/parabolic-antenna-model.cc 

CC_DEPS += \
./forbackup/src/antenna/model/angles.d \
./forbackup/src/antenna/model/antenna-model.d \
./forbackup/src/antenna/model/cosine-antenna-model.d \
./forbackup/src/antenna/model/isotropic-antenna-model.d \
./forbackup/src/antenna/model/parabolic-antenna-model.d 

OBJS += \
./forbackup/src/antenna/model/angles.o \
./forbackup/src/antenna/model/antenna-model.o \
./forbackup/src/antenna/model/cosine-antenna-model.o \
./forbackup/src/antenna/model/isotropic-antenna-model.o \
./forbackup/src/antenna/model/parabolic-antenna-model.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/antenna/model/%.o: ../forbackup/src/antenna/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


