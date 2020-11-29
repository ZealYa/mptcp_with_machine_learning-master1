################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/netanim/examples/colors-link-description.cc \
../forbackup/src/netanim/examples/dumbbell-animation.cc \
../forbackup/src/netanim/examples/grid-animation.cc \
../forbackup/src/netanim/examples/resources-counters.cc \
../forbackup/src/netanim/examples/star-animation.cc \
../forbackup/src/netanim/examples/uan-animation.cc \
../forbackup/src/netanim/examples/wireless-animation.cc 

CC_DEPS += \
./forbackup/src/netanim/examples/colors-link-description.d \
./forbackup/src/netanim/examples/dumbbell-animation.d \
./forbackup/src/netanim/examples/grid-animation.d \
./forbackup/src/netanim/examples/resources-counters.d \
./forbackup/src/netanim/examples/star-animation.d \
./forbackup/src/netanim/examples/uan-animation.d \
./forbackup/src/netanim/examples/wireless-animation.d 

OBJS += \
./forbackup/src/netanim/examples/colors-link-description.o \
./forbackup/src/netanim/examples/dumbbell-animation.o \
./forbackup/src/netanim/examples/grid-animation.o \
./forbackup/src/netanim/examples/resources-counters.o \
./forbackup/src/netanim/examples/star-animation.o \
./forbackup/src/netanim/examples/uan-animation.o \
./forbackup/src/netanim/examples/wireless-animation.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/netanim/examples/%.o: ../forbackup/src/netanim/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


