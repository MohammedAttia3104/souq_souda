import 'package:dartz/dartz.dart';
import 'package:souq_souda/core/errors/exceptions.dart';
import 'package:souq_souda/core/errors/failure.dart';
import 'package:souq_souda/gold/data/data_sources/company_remote_data_source.dart';
import 'package:souq_souda/gold/domain/entities/company_entity.dart';
import 'package:souq_souda/gold/domain/repositories/base_company_repository.dart';

class CompanyRepository extends BaseCompanyRepository {
  final BaseCompanyRemoteDataSource baseCompanyRemoteDataSource;

  CompanyRepository(this.baseCompanyRemoteDataSource);

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async {
    final result = await baseCompanyRemoteDataSource.getCompanies();
    try {
      return Right(result);
    } on ServerException catch (f) {
      return Left(ServerFailure(f.errorMessageModel.statusMessage));
    }
  }
}
