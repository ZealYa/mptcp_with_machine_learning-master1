################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mobility/examples/bonnmotion-ns2-example.cc \
../forbackup/src/mobility/examples/main-grid-topology.cc \
../forbackup/src/mobility/examples/main-random-topology.cc \
../forbackup/src/mobility/examples/main-random-walk.cc \
../forbackup/src/mobility/examples/mobility-trace-example.cc \
../forbackup/src/mobility/examples/ns2-mobility-trace.cc 

CC_DEPS += \
./forbackup/src/mobility/examples/bonnmotion-ns2-example.d \
./forbackup/src/mobility/examples/main-grid-topology.d \
./forbackup/src/mobility/examples/main-random-topology.d \
./forbackup/src/mobility/examples/main-random-walk.d \
./forbackup/src/mobility/examples/mobility-trace-example.d \
./forbackup/src/mobility/examples/ns2-mobility-trace.d 

OBJS += \
./forbackup/src/mobility/examples/bonnmotion-ns2-example.o \
./forbackup/src/mobility/examples/main-grid-topology.o \
./forbackup/src/mobility/examples/main-random-topology.o \
./forbackup/src/mobility/examples/main-random-walk.o \
./forbackup/src/mobility/examples/mobility-trace-example.o \
./forbackup/src/mobility/examples/ns2-mobility-trace.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mobility/examples/%.o: ../forbackup/src/mobility/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


