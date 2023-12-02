import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/gold/domain/entities/company_entity.dart';

abstract class BaseCompanyRepository{
  Future<Either<Failure,List<CompanyEntity>>> getCompanies();
}