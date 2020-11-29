################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/stats/helper/file-helper.cc \
../forbackup/src/stats/helper/gnuplot-helper.cc 

CC_DEPS += \
./forbackup/src/stats/helper/file-helper.d \
./forbackup/src/stats/helper/gnuplot-helper.d 

OBJS += \
./forbackup/src/stats/helper/file-helper.o \
./forbackup/src/stats/helper/gnuplot-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/stats/helper/%.o: ../forbackup/src/stats/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


