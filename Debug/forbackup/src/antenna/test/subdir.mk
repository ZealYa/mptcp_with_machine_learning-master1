################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/antenna/test/test-angles.cc \
../forbackup/src/antenna/test/test-cosine-antenna.cc \
../forbackup/src/antenna/test/test-degrees-radians.cc \
../forbackup/src/antenna/test/test-isotropic-antenna.cc \
../forbackup/src/antenna/test/test-parabolic-antenna.cc 

CC_DEPS += \
./forbackup/src/antenna/test/test-angles.d \
./forbackup/src/antenna/test/test-cosine-antenna.d \
./forbackup/src/antenna/test/test-degrees-radians.d \
./forbackup/src/antenna/test/test-isotropic-antenna.d \
./forbackup/src/antenna/test/test-parabolic-antenna.d 

OBJS += \
./forbackup/src/antenna/test/test-angles.o \
./forbackup/src/antenna/test/test-cosine-antenna.o \
./forbackup/src/antenna/test/test-degrees-radians.o \
./forbackup/src/antenna/test/test-isotropic-antenna.o \
./forbackup/src/antenna/test/test-parabolic-antenna.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/antenna/test/%.o: ../forbackup/src/antenna/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


