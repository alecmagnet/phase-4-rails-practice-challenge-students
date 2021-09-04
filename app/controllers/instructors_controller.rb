class InstructorsController < ApplicationController
	wrap_parameters format: []

	# rescue_froms in application_controller

	# GET /instructors
	def index
		instructors = Instructor.all 
		render json: instructors, status: :ok
	end

	# GET /instructors/:id
	def show
		instructor = find_instructor
		render json: instructor, status: :ok
	end

	# POST /instructors
	def create
		instructor = Instructor.create!(instructor_params)
		render json: instructor, status: :created
	end

	# PATCH /instructors/:id
	def update
		instructor = find_instructor
		instructor.update!(instructor_params)
		render json: instructor, status: :accepted
	end

	#DELETE /instructors/:id
	def destroy
		instructor = find_instructor
		instructor.destroy
		head :no_content
	end

	private

	def find_instructor
		Instructor.find(params[:id])
	end

	def instructor_params
		params.permit(:name)
	end

end
