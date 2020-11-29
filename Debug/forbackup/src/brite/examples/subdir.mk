################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/brite/examples/brite-MPI-example.cc \
../forbackup/src/brite/examples/brite-generic-example.cc 

CC_DEPS += \
./forbackup/src/brite/examples/brite-MPI-example.d \
./forbackup/src/brite/examples/brite-generic-example.d 

OBJS += \
./forbackup/src/brite/examples/brite-MPI-example.o \
./forbackup/src/brite/examples/brite-generic-example.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/brite/examples/%.o: ../forbackup/src/brite/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


